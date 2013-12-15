#!/usr/bin/ruby
#
# == Synopsis
#
# flickr_download: batch downloader for photos stored on Flickr
#
# == Usage
#
# flickr_download -u NAME -i ID	[OPTION] ...
#
# flickr_download -u NAME -t TITLE [OPTION] ...
#
# -h, --help
#   this usage message
#
# -i, --photoset-id
#   target photoset id
#   
# -t, --photoset-title
#   target photoset title
#
# -u, --username
#   photos owner username (required argument)
#
# -c, --stdout
#   do not download photos, only dump their static URLs on stdout

# Copyright (C) 2006 Stefano Zacchiroli
#
# This program is free software, you can redistribute it and/or modify it under
# the terms of the GNU General Public License version 2 as published by the
# Free Software Foundation; either version 2 of the License, or (at your
# option) any later version.
#
# Created:	  Mon, 25 Sep 2006 17:30:44 +0200 zack
# Last-Modified:  Mon, 25 Sep 2006 17:44:40 +0200 zack

require 'net/http'
require 'optparse'
require 'rdoc/usage'
require 'uri'

$LOAD_PATH << File.join(ENV['HOME'], 'lib/ruby')
require 'flickr'

# mixin for checking and possibly obtaining an authentication token from flickr
module Authorizer

  DEFAULT_TOKEN_CACHE_FILE = File.join(ENV['HOME'], '.flickr_auth')
  API_KEY = 'bd58d18427f40e82d7b2f0dbf6f2dc7a'
  SHARED_SECRET = 'b87f58d931a16d4f'

  # check if a auth token is present, if not generate a frob and interactively
  # wait for the user to authorize the current application.  As a side-effect
  # set the instance variable @flickr to a new Flickr instance
  def get_auth_token(cache_file = DEFAULT_TOKEN_CACHE_FILE)
    @flickr = Flickr.new(cache_file, API_KEY, SHARED_SECRET) unless @flickr
    unless @flickr.auth.token
      @flickr.auth.getFrob
      url = @flickr.auth.login_link
      puts "You must visit #{url} to authorize flickr_download.\n" +
	"Press enter when you have done so. " +
	"This is the only time you will have to do this."
      gets
      @flickr.auth.getToken
      @flickr.auth.cache_token
    end
  end

end

class Downloader

  include Authorizer

  def initialize(username, pred, download=true)
    @username = username  # name of the photoset owner
    @set_predicate = pred # photoset predicate
    @download = download  # should we download? (or only print urls ...)
    get_auth_token
  end

  def go
    user = @flickr.people.findByUsername @username
    set = (@flickr.photosets.getList user).find &@set_predicate
    fail "can't find a matching set" unless set
    if @download
      threads = []
      each_url(set) {|url|
	threads << Thread.new(url) {|url_text|
	  url = URI.parse(url_text)
	  puts "starting download of #{url_text} ..."
	  res = Net::HTTP.get_response url
	  File.open(File.basename(url.path), "w") {|f| f << res.body }
	}
      }
      puts 'waiting for all downloads to complete ...'
      threads.each {|thread| thread.join }
      puts 'all done.'
    else
      each_url(set) {|url| puts url}
    end
  end

  private

  def each_url(set)
    @flickr.photosets.getInfo set
    puts "will download #{set.photos.length}" \
      + " photo#{set.photos.length > 1 ? 's' : ''}(s)" if @download
    set.photos.each {|photo|
      @flickr.photos.getInfo photo
      best_size = find_best_size photo.sizes
      yield best_size.source
    }
  end

  def find_best_size(sizes)
    sorted_best_first = sizes.sort_by {|tag, _|
      case tag
      when :Original; 1
      when :Large; 2
      when :Medium; 3
      when :Small; 4
      when :Square; 5
      when :Thumbnail; 6
      end
    } # first element returned is now a pair: <best size tag, best size>
    sorted_best_first[0][1]
  end

end

def parse_cmdline
  options = {
    :photoset_id => nil,
    :photoset_title => nil,
    :download => true,
    :username => nil,
  }
  cmdline =
    GetoptLong.new(
		   ['--help', '-h', GetoptLong::NO_ARGUMENT],
		   ['--photoset-id', '-i', GetoptLong::REQUIRED_ARGUMENT],
		   ['--photoset-title', '-t', GetoptLong::REQUIRED_ARGUMENT],
		   ['--username', '-u', GetoptLong::REQUIRED_ARGUMENT],
		   ['--stdout', '-c', GetoptLong::NO_ARGUMENT]
		  )
  cmdline.each do |opt, arg|
    case opt
    when '--help' ; RDoc::usage
    when '--photoset-id' ; options[:photoset_id] = arg
    when '--photoset-title' ; options[:photoset_title] = arg
    when '--stdout' ; options[:download] = false
    when '--username' ; options[:username] = arg
    end
  end
  RDoc::usage unless options[:username]
  RDoc::usage unless options[:photoset_id] or options[:photoset_title]
  RDoc::usage if options[:photoset_id] and options[:photoset_title]
  options
end

options = parse_cmdline
if options.has_key? :photoset_id
  pred = lambda {|set| set.id == options[:photoset_id]}
elsif options.has_key? :photoset_title
  pred = lambda {|set| set.title == options[:photoset_title]}
end
(Downloader.new(options[:username], pred, options[:download])).go


#!/usr/bin/env ruby

require 'rubygems'
require 'flickr'
require 'ftools'
require 'yaml'

API_KEY = "bd58d18427f40e82d7b2f0dbf6f2dc7a"
SHARED_SECRET = "b87f58d931a16d4f"

SCREEN_RESOLUTION = [1440,900]


def is_background_image(photo, config)
  return false unless photo.sizes[:Original]
  photo.sizes[:Original].width > photo.sizes[:Original].height &&
      photo.sizes[:Original].width > 800 && !config[:used_backgrounds].include?(photo.id)
end

def get_flickr_photo(flickr,config)
  found = nil
  10.times { |i|
    is_end = false

    page = i +(config[:last_page]||0) +1
    puts "checking page #{page}"
    photos = flickr.interestingness.getList(nil, nil, 10, page)
    break if photos.nil? || photos.empty?

    for photo in photos
      if photo.nil?
        is_end = true 
        break
      end
      if is_background_image(photo, config)
        found = photo 
        break
      end
    end

    break if is_end
    if found 
      config[:last_page] = page
      break
    end
  }
  found
end

def clear_config(config)
  config[:used_backgrounds] = []
  config[:last_page] = nil
  config[:last_updated] = Date.today
end

bg_dir = File.expand_path '~/.flickr-backgrounds'
`mkdir -p #{bg_dir}` unless File.exist?(bg_dir)

config = {:last_updated=> []}
config_file = File.join(bg_dir, 'config.yml')
config = YAML::load(File.open(config_file)) if File.exists?(config_file)

if config[:last_updated] != Date.today
  clear_config config
end

flickr = Flickr.new(File.join(bg_dir, 'rflickr.cache'), API_KEY, SHARED_SECRET)
unless flickr.auth.token
  flickr.auth.getFrob
  url = flickr.auth.login_link
  puts "You must visit #{url} to authorize this application.  Press enter "+
      'when you have done so. This is the only time you will have to do this.'
  gets
  flickr.auth.getToken
  flickr.auth.cache_token
end

photo = get_flickr_photo flickr, config
unless photo
  clear_config config
  photo = get_flickr_flickr, config
end

config[:used_backgrounds].push photo.id
f = File.open(config_file, 'w+')
f.write config.to_yaml
f.close

size = nil
unless photo.sizes[:Original].width < SCREEN_RESOLUTION[0]
  distances = {}
  photo.sizes.each_pair { |k,v|
    d = (SCREEN_RESOLUTION[0] - v.width).abs
    distances[k] = d
    size = k if d < 500
  }

  unless size 
    size = distances.min { |arr1, arr2| arr1[1] <=> arr2[1] }[0]
  end
else
  size = :Original
end

f = File.open(File.join(bg_dir, 'background_new'), 'w+')
f.write(Net::HTTP.get(URI.parse(photo.sizes[size].source)))
f.close

bg_file = File.join(bg_dir, 'background')
if File.exists?(bg_file)
  File.delete bg_file
  bg_file = File.join(bg_dir, 'background2')
end
File.move(f.path, bg_file) 

`gconftool -t string -s /desktop/gnome/background/picture_filename #{bg_file}`

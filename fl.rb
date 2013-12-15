require 'rubygems'
require 'flickr'
MY_KEY='d58d18427f40e82d7b2f0dbf6f2dc7a'
class Flickr
  alias old_initialize initialize
  def initialize(api_key=MY_KEY, email=nil, password=nil)
    puts "new_initialize " + MY_KEY
    old_initialize(api_key, email, password)
    @host="http://api.flickr.com"
    @activity_file='flickr_activity_cache.xml'
  end
end

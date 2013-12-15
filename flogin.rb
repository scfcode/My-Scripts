
require 'rubygems'
require 'flickr'

class FlickrLogin

  APPLICATION_KEY = 'bd58d18427f40e82d7b2f0dbf6f2dc7a'
  SHARED_SECRET = 'b87f58d931a16d4f'
  
   def run()
       create_token unless @flickr.auth.token   end
     
   def initialize(config)       @config = config       @flickr = Flickr.new(@config.user_home_dir + ".flickr-token",APPLICATION_KEY,SHARED_SECRET)   end

   def create_token()
       # @flickr.auth.getFrob       # url = @flickr.auth.login_link       # gets       # @flickr.auth.getToken       # @flickr.auth.cache_token   end
   
end

require 'rubygems'
require 'flickr'

class FlickrLogin

  APPLICATION_KEY = 'bd58d18427f40e82d7b2f0dbf6f2dc7a'
  SHARED_SECRET = 'b87f58d931a16d4f'
  
   def run()
       create_token unless @flickr.auth.token
     
   def initialize(config)

   def create_token()
       # @flickr.auth.getFrob
   
end
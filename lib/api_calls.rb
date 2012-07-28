require 'httparty'
require 'json'


module Instaconcert
  class Instagram
    include HTTParty
    format :json
    
    base_uri 'https://api.instagram.com/v1'
    
    def initialize(default_params)
      self.class.default_params default_params
    end
    
    def media_popular()
      self.class.get('/media/popular')
    end
        
    def media_search(lat, lng, max_timestamp, min_timestamp, distance)
      self.class.get('/media/search', :query => { :lat => lat, :lng => lng, :max_timestamp => max_timestamp, :min_timestamp => min_timestamp, :distance => distance, :count => 50 } )
    end  
  end
end
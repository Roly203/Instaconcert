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
      self.class.get('/media/search', :query => { :lat => lat, :lng => lng, :max_timestamp => max_timestamp, :min_timestamp => min_timestamp, :distance => distance } )
    end
    
    def location_recent(location_id, max_timestamp, min_timestamp)
      self.class.get('/locations/'+ location_id + '/media/recent', :query => { :location_id => location_id, :max_timestamp => max_timestamp, :min_timestamp => min_timestamp })
    end
    
    def location_search(lat, lng, distance)
      self.class.get('/locations/search', :query => { :lat => lat, :lng => lng, :distance => distance })
    end
    
    def location_search_4sq_id(foursquare_v2_id, distance)
      self.class.get('locations/search', :query => { :foursquare_v2_id => foursquare_v2_id, :distance => distance })
    end
    
  end
end
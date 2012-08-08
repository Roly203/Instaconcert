require 'api_calls'

class Event < ActiveRecord::Base
  attr_accessible :name, :min_timestamp, :max_timestamp, :distance, :venue_name, :start_time, :lat, :long, :details, :eventgroup_id, :thumb_img_id
  has_many :images
	belongs_to :eventgroup

	#Use to assign an eventgroup_id to all events from a certain "name"/sport
	def assign_group(g, n)
		Event.where(:name => n).each do |e|
			e.update_attributes(:eventgroup_id => g)
		end
	end
	
	def interval_count
	  return 20
  end
	
	
	#this is what fills images for a particular event
	def fill_images
	                        
      interval = ((self.max_timestamp - self.min_timestamp) / interval_count )
                        
      instagram = Instaconcert::Instagram.new(:client_id => "46bd5797cd3d4ea685cbe3372510cf0c")
                        
      instagram_image_array = []
      #Make the API  Media/Search calls
      interval_count.times do |i| 
        insta_call = instagram.media_search(self.lat, self.long, 
                                    self.max_timestamp - interval*(interval_count-(i+1)),
                                    self.min_timestamp + interval*(i), 
                                    self.distance)

        if ( !insta_call["data"].nil? && insta_call["meta"]["code"] = 200 ) then
          instagram_image_array += insta_call["data"]
        end
      end
      
      max_likes = 0
                                     
      instagram_image_array.each_with_index do |img, i|
        new_img = Image.new
        new_img.fill_image(img)
        new_img[:event_id] = self.id
        new_img.save
                          
        #this is broken                
        if new_img[:like_count] >= max_likes then
          self.thumb_img_id = new_img[:id]
          self.save          
        end
        
      end
  end
	
end

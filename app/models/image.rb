class Image < ActiveRecord::Base
  attr_accessible :caption_text, :caption_time, :img_lowres_url, :img_standard_url, :img_thumb_url, :img_time, :instagram_id, :instagram_link_url, :lat, :like_count, :long, :event_id
  
  belongs_to :event
  
  def fill_image(img)
     self.instagram_id = img["id"]
     self[:lat] = img["location"]["latitude"]
     self[:long] = img["location"]["longitude"]
     self[:img_lowres_url] = img["images"]["low_resolution"]["url"]
     self[:img_thumb_url] = img["images"]["thumbnail"]["url"]
     self[:img_standard_url] = img["images"]["standard_resolution"]["url"]
     #if img["id"] = "238555744168411625_11614703" then puts img["caption"]
    # end
     if img["caption"] then 
       self[:caption_text] = img["caption"]["text"]
       self[:caption_time] = Time.at(img["caption"]["created_time"].to_i)
     end
     if img ["likes"]
       self[:like_count] = img["likes"]["count"]
     end
     self[:img_time] = Time.at(img["created_time"].to_i)
     self[:instagram_link_url] = img["link"]
  end
end

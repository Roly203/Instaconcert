class Image < ActiveRecord::Base
  attr_accessible :caption_text, :caption_time, :img_lowres_url, :img_standard_url, :img_thumb_url, :img_time, :instagram_id, :instagram_link_url, :lat, :like_count, :long, :event_id
  
  belongs_to :event
  
end

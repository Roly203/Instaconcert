class EventRequest < ActiveRecord::Base
  attr_accessible :distance, :lat, :long, :max_timestamp, :min_timestamp
end

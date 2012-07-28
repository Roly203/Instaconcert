require 'api_calls'

class Event < ActiveRecord::Base
  attr_accessible :name, :min_timestamp, :max_timestamp, :distance, :venue_name, :start_time, :lat, :long
end

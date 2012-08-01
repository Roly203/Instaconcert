require 'api_calls'

class Event < ActiveRecord::Base
  attr_accessible :name, :min_timestamp, :max_timestamp, :distance, :venue_name, :start_time, :lat, :long, :details, :eventgroup_id
  has_many :images
	belongs_to :eventgroup

	
	
	#Use to assign an eventgroup_id to all events from a certain "name"/sport
	def assign_group(g, n)
		Event.where(:name => n).each do |e|
			e.update_attributes(:eventgroup_id => g)
		end
	end
	
	
end

class Eventgroup < ActiveRecord::Base
  attr_accessible :name
	has_many :events
	has_many :images, :through => :events
end

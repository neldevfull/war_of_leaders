class Phasestart < ActiveRecord::Base

	# Relationship
	belongs_to :phase
	belongs_to :user

end

#encoding: utf-8

class Team < ActiveRecord::Base

	# Realtionship
	belongs_to :user

end

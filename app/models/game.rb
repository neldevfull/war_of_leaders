#encoding: utf-8

class Game < ActiveRecord::Base

	# Realtionship
	belongs_to :user

end

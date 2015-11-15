class Question < ActiveRecord::Base

	# Relationship
	belongs_to :game
	belongs_to :phase
	has_many   :answer

end

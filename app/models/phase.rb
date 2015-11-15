class Phase < ActiveRecord::Base

	# Realtionship
	belongs_to :game
	has_many   :phasestart
	has_many   :question

end

class Team < ActiveRecord::Base

	# Realtionship
	belongs_to :user
	belongs_to :start

	def get_teams
		return ["Red Team", "Yellow Team",
		"Orange Team", "Green Team",
		"Blue Team", "Purple Team",
		"Magento Team", "Cyan Team"]
	end

end

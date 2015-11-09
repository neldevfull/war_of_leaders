class Start < ActiveRecord::Base

	# Realtionship
	belongs_to :user
	belongs_to :game
	has_many   :team

	# Validate
	validate do |start|
		if start.number_team.present?
			unless start.number_team >= 2 && 
				start.number_team <= 8
				errors.add :number_team,
					"Máximo 8, mínimo 2"
			end
		else
			errors.add :number_team,
				"Não pode ser vazio"
		end
	end

end

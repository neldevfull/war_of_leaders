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

	def get_start(key_master, user_id)
		connect = get_connection()
		connect.select_all(
			"SELECT game_id, number_team FROM starts
			WHERE key_master = '#{key_master}'
			AND user_id = #{user_id} LIMIT 1")
	end

	private 

	def get_connection
		Start.connection
	end

end

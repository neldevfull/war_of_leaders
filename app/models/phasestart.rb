class Phasestart < ActiveRecord::Base

	# Relationship
	belongs_to :phase
	belongs_to :user

	def phasestart?(key_master, user_id)
		connect = get_connection()
		connect.select_all(
			"SELECT starts.game_id, phasestarts.phase_id 
			FROM starts 
			JOIN users ON starts.user_id = users.id
			JOIN phasestarts ON users.id = phasestarts.user_id
			WHERE starts.key_master = (
			SELECT key_master FROM starts
			WHERE user_id = #{user_id})
			AND users.profile = 'master' 
			AND starts.key_master = '#{key_master}'; ")
	end

	private 

	def get_connection
		Phasestart.connection
	end

end

class Team < ActiveRecord::Base

	# Realtionship
	belongs_to :user
	belongs_to :start

	def get_teams
		return [
			{ 
				:team => "Red Team",     
				:bgcolor => "208, 32, 35",
				:menucolor => "#AF1C1E",
				:hovercolor => "#7C1618",
				:players => [],
				:part => 0 
			},
			{ 
				:team => "Yellow Team",  
				:bgcolor => "221, 218, 0",
				:menucolor => "#E0BE00",
				:hovercolor => "#C4A300",
				:players => [],
				:part => 0 
			},
			{ 
				:team => "Orange Team",  
				:bgcolor => "255, 165, 0",
				:menucolor => "#D88900",
				:hovercolor => "#C67D00",
				:players => [],
				:part => 0 
			},
			{ 
				:team => "Green Team",   
				:bgcolor => "0, 128, 0",
				:menucolor => "#006B00",
				:hovercolor => "#004700",
				:players => [],
				:part => 0 
			},
			{ 
				:team => "Blue Team",    
				:bgcolor => "47, 65, 102",
				:menucolor => "#273654",
				:hovercolor => "#182133",
				:players => [],
				:part => 0 
			},
			{ 
				:team => "Magento Team", 
				:bgcolor => "201, 42, 87",
				:menucolor => "#A82548",
				:hovercolor => "#91213F",
				:players => [],
				:part => 0 
			},
			{ 
				:team => "Cyan Team",    
				:bgcolor => "0, 137, 191",
				:menucolor => "#0077A3",
				:hovercolor => "#005D7F",
				:players => [],
				:part => 0 
			},
			{ 
				:team => "Puple Team",    
				:bgcolor => "128, 0, 128",
				:menucolor => "#680068",
				:hovercolor => "#590059",
				:players => [],
				:part => 0 
			}
		]
	end

	def get_user_by_teams(key_master)
		connect = get_connection()
		connect.select_all(
			"SELECT users.nikename, teams.name
			FROM teams 
			JOIN users ON teams.user_id = users.id
			WHERE teams.key_master = '#{key_master}' ")
	end

	def remove_user_by_teams(user_id)
		connect = get_connection()
		connect.select_all(
			"DELETE FROM teams 
			WHERE user_id = #{user_id} ")
	end

	private 

	def get_connection
		Team.connection
	end

end

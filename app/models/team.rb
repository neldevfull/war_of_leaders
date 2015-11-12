class Team < ActiveRecord::Base

	# Realtionship
	belongs_to :user
	belongs_to :start

	def get_teams
		return [
			{ :team => "Red Team",     
				:color => "red",
				:players => [],
				:part => 0 },
			{ :team => "Yellow Team",  
				:color => "yellow",
				:players => [],
				:part => 0 },
			{ :team => "Orange Team",  
				:color => "orange",
				:players => [],
				:part => 0 },
			{ :team => "Green Team",   
				:color => "green",
				:players => [],
				:part => 0 },
			{ :team => "Blue Team",    
				:color => "blue",
				:players => [],
				:part => 0 },
			{ :team => "Magento Team", 
				:color => "magento",
				:players => [],
				:part => 0 },
			{ :team => "Cyan Team",    
				:color => "cyan",
				:players => [],
				:part => 0 } 
		]
	end

	def get_user_by_teams()
		connect = get_connection()
		connect.select_all(
			"SELECT users.nikename, teams.name
			FROM teams 
			JOIN users ON teams.user_id = users.id;")
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

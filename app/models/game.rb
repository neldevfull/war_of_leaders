#encoding: utf-8

class Game < ActiveRecord::Base

	# Realtionship
	belongs_to :user
	has_many   :start
	has_many   :phase
	has_many   :question	

	# Data Access Object

	def uninitiated_games(user_id)
		connect = get_connection()
		connect.select_all(
			"SELECT id, title, image, slogan FROM games
			 WHERE games.id NOT IN 
			 	(SELECT game_id FROM starts 
			 		WHERE user_id = #{user_id});")
	end

	def initialized_games(user_id)
		connect = get_connection()
		connect.select_all(
			"SELECT games.id AS id, 
				starts.key_master, 				
				starts.user_id,  
				title, image, slogan,
			    starts.key_master
			FROM games 
			JOIN starts ON games.id = starts.game_id
			WHERE starts.user_id = #{user_id};")
	end

	def game_title(key_master)
		connect = get_connection()
		connect.select_all(
			"SELECT games.title
			FROM games
			JOIN starts ON games.id = starts.game_id
			WHERE starts.key_master = '#{key_master}'
			LIMIT 1; ")
	end

	private 

	def get_connection
		Game.connection
	end

end

#encoding: utf-8

class Game < ActiveRecord::Base

	# Realtionship
	belongs_to :user
	has_many   :start
	has_many   :phase

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
				starts.user_id,  
				title, image, slogan,
			    starts.key_master
			FROM games 
			JOIN starts ON games.id = starts.game_id
			WHERE starts.user_id = #{user_id};")
	end

	private 

	def get_connection
		Game.connection
	end

end

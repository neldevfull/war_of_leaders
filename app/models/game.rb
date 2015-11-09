#encoding: utf-8

class Game < ActiveRecord::Base

	# Realtionship
	belongs_to :user
	has_one    :start
	has_many   :phase

	def uninitiated_games
		connect = get_connection()
		connect.select_all(
			"SELECT id, title, image, slogan FROM games
			 WHERE games.id NOT IN 
			 	(SELECT id FROM starts);")
	end

	def initialized_games(user_id)
		connect = get_connection()
		connect.select_all(
			"SELECT games.id, title, image, slogan,
			    starts.key_master
			FROM games 
			JOIN starts ON games.id = starts.game_id
			WHERE starts.user_id = 1;")
	end

	private 

	def get_connection
		Game.connection
	end

end

class MastersController < ApplicationController

	# Before Action
	before_action :get_user_session, only: :index

	def index
		# Get game starts to user
		user = get_user_session()
		@games_of_user = Game.new.initialized_games(user.id)

		# Uninitiated Games
		@games = Game.new.uninitiated_games()
	end

end

class GamesController < ApplicationController

	def index
		@games = Game.all		
		# render :json => {
		# 	:response => games,
		# 	:error     => true
		# }
	end
end
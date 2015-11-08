class MastersController < ApplicationController

	def index
		@user  = current_user()
		@games = Game.all() 
	end

end

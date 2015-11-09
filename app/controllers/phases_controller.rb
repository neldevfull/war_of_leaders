class PhasesController < ApplicationController

	# Before Action
	before_action :get_user_session, only: :index

	def index
		game        = Game.find(params[:id])
		@game_title = game.title
		@phases     = game.phase 
	end
end
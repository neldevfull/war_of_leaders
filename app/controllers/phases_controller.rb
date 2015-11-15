class PhasesController < ApplicationController

	# Before Action
	before_action :get_user_session, only: :index
	before_action :get_color_team, only: :index

	def index
		game        = Game.find(params[:game_id])
		@key_master = params[:key_master]
		@game_title = game.title
		@phases     = game.phase 
	end
end
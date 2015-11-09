# Requires
require 'main_module'

class StartsController < ApplicationController

	# Includes
	include MainModule

	# Before Action
	before_action :get_user_session, 
		only: [:new, :show]

	def new
		@game = Game.find(params[:id])
		get_start()
	end

	def create
		user = get_user_session()
		key_master = generate_token()

		start = Start.new
		start.user_id = user.id
		start.game_id = params[:game_id]
		start.number_team = params[:start][:number_team]
		start.key_master = key_master

		if start.save
			redirect_to show_starts_path(
				start)
		else		
			redirect_to new_starts_path(
				user.id),
			notice: start.errors[:number_team]
		end
	end

	def show
		@names  = ""
		comma   = ","
		@start  = Start.find(params[:id])
		names   = Team.new.get_teams()
		counter = @start.number_team 

		while(counter > 0) do
			@names += "#{names[counter]}#{comma} "
			counter -= 1

			if (counter - 1) == 0
				comma = "."
			end
		end
	end

	private 	

	def get_start
		@start = Start.new
	end

end

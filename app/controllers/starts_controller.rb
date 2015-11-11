# Requires
require 'main_module'

class StartsController < ApplicationController

	# Includes
	include MainModule

	# Before Action
	before_action :get_user_session, 
		only: [:new, :show]

	def new
		@user = get_user_session()
		@game = Game.find(params[:id])
		get_start()
	end

	def create
		success   = true
		msg_error = ""
		user      = get_user_session()
		profile   = user.profile

		if profile == "master"
			key_master  = generate_token()
			game_id     = params[:game_id]
			number_team = params[:start][:number_team]
		else
			start = Start.find_by(key_master: params[:start][:key_master])
			if start.present?
				key_master  = start.key_master
				game_id     = start.game_id
				number_team = start.number_team 
			else
				success = false
				msg     = "Chave Mestra incorreta"
			end
		end
		
		if success == true
			start = Start.new
			start.user_id     = user.id
			start.game_id     = game_id
			start.number_team = number_team
			start.key_master  = key_master

			if start.save
				if profile == "master"
					redirect_to(
						show_starts_path(start))
				else
					redirect_to (
						index_phases_path(game_id))
				end
			else		
				success = false
				msg     = start.errors[:number_team]		
			end
		end

		if success == false
			redirect_to new_starts_path(
				params[:game_id]),
				notice: msg
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

class TeamsController < ApplicationController

	# Before Action
	before_action :get_user_session, 
		only: [:index, :new]
	before_action :get_color_team,
		only: [:index]

	def index
		@team       = Team.new
		game        = Game.new
		@number     = "" 
		@key_master = params[:key_master]
		@user       = get_user_session

		results = Team.new.get_user_by_teams(@key_master) 
		@teams  = Team.new.get_teams()

		@teams.each do |team|
			results.each do |result|
				if result["name"] == team[:team]
					team[:players] << result["nikename"]
					if result["nikename"] == @user.nikename
						team[:part] = 1
					end
				end 
			end
		end
		
		results = Start.new.get_start(
			@key_master, @user.id)
		
		results.each do |result|
			game     = Game.find(result["game_id"]) 
			@number  = result["number_team"]
		end

		@phases = game.phase
	end

	def new
		@team = Team.new
	end

	def create
		@team = @team = Team.new
		@team.key_master = params[:team][:key_master]
		@team.user_id    = params[:team][:user_id]
		@team.name       = params[:team][:name] 
		@team.bgcolor    = params[:team][:bgcolor]
		@team.menucolor  = params[:team][:menucolor]
		@team.hovercolor = params[:team][:hovercolor]

		if @team.save
			redirect_to index_teams_path(@team.key_master)
		else
			render :new
		end
	end

	def destroy
		user = get_user_session
		team = Team.find_by(user_id: user.id)
		key_master = team.key_master

		Team.new.remove_user_by_teams(user.id)
		redirect_to index_teams_path(key_master)
	end

end

class TeamsController < ApplicationController

	# Before Action
	before_action :get_user_session, 
		only: [:index, :new]

	def index
		@team = Team.new
	end

	def new
		@team = Team.new
	end

	def create
		@teams = params[:team]
		if team.save
			redirect_to @teams
		else
			render :new
		end
	end

end
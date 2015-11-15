# Requires
require 'main_module'

class UsersController < ApplicationController
	# Includes
	include MainModule

	# Before Action
	before_action :get_user_session, only: :index
	before_action :get_color_team, only: :index

	def index
		# Get game starts to user
		user = get_user_session()
		@games_of_user = Game.new.initialized_games(user.id)

		# Uninitiated Games
		@games = Game.new.uninitiated_games(user.id)
	end

	def new
		@user = User.new 
	end

	def create
		# Vars
		profile    = params[:user][:profile] 

		# Save User
		@user = User.new user_params
		if @user.save
			user_session = UserSession.new(session)
			user_session.store(@user)
			redirect_to index_users_path
		else
			respond_to do |format|
				format.html {
					render :new
				}
			end
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
	end

	private 

	def user_params
		params.require(:user)
			.permit("nikename", "email", "password", 
				"password_confirmation", "gender",
				"institution", "course", "profile", "key_master")
	end

end
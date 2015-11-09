# Requires
require 'main_module'

class UsersController < ApplicationController
	# Includes
	include MainModule

	def index
		@users = User.all
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
			if profile == "player"
				respond_to do |format|
					format.html {
						redirect_to :controller => 'players', 
						:action => 'index'
					}
				end
			else
				respond_to do |format|
					format.html {
						redirect_to :controller => 'masters', 
						:action => 'index'
					}
				end
			end
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
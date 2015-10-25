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
		@user = User.new user_params
		if @user.save
			respond_to do |format|
				format.html {
					redirect_to new_user_path,
					notice: "Sucesso"
				}
			end
		else
			respond_to do |format|
				format.html {
					redirect_to new_user_path,
					notice: "Falha"
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
			.permit("nikename", "email", "password", "gender",
				"institution", "course", "profile")
	end

end
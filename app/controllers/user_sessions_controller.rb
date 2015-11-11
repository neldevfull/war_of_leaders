class UserSessionsController < ApplicationController
	# Before action
	before_action :require_no_authentication, only: [:new, :create]
	before_action :require_authentication, only: :destroy

	def new
		@user_session = UserSession.new(session)
		@user = User.new
	end

	def create
		@user_session = UserSession.new(session, 
			params[:user_session])		
		
		if @user_session.authenticate!
			
			user = @user_session.current_user()
			
			redirect_to index_users_path
		else			
			redirect_to get_user_sessions_path,
				notice: "Credenciais nao conferem"	
		end
	end

	def destroy
		user_session.destroy
		redirect_to root_path
	end

end

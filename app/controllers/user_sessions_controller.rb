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
			render :json => {
				:response => "",
				:action   => "authenticate",
				:fail     => false
			}
		else
			render :json => {
				:response => "Credenciais nao conferem",
				:action   => 'authenticate',
				:fail     => true
			}		
		end
	end

	def destroy
		user_session.destroy
		respond_to do |format|
			format.html { 
				redirect_to new_user_sessions_path, 
				notice: "Usuario nao esta logado" 
			}		      
		end
	end

end

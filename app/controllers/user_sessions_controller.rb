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
			
			if user.profile == "master"
				respond_to do |format|
					format.html {
						redirect_to index_masters_path
					}
				end
			else
				respond_to do |format|
					format.html {
						redirect_to index_players_path
					}
				end
			end
		else			
			respond_to do |format|
				format.html {
					redirect_to get_user_sessions_path,
					notice: "Credenciais nao conferem"
				}
			end		
		end
	end

	def destroy
		user_session.destroy
		respond_to do |format|
			format.html { 
				redirect_to root_path
			}		      
		end
	end

end

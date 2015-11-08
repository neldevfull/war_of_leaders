class HomeController < ApplicationController

	# Before Action
	before_action :require_no_authentication, only: :home
	before_action :get_user_session, only: :home

	def home
		@user_session = UserSession.new(session)		
		@games = Game.all
	end

end

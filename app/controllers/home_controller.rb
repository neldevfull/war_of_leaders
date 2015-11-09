class HomeController < ApplicationController

	# Before Action
	before_action :require_no_authentication, only: :home

	def home
		@user = User.new
		@user_session = UserSession.new(session)		
		@games = Game.all
	end

end

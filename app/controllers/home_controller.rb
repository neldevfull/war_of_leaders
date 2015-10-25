class HomeController < ApplicationController

	def home
		@user_session = UserSession.new(session)
		@user = User.new
	end

end

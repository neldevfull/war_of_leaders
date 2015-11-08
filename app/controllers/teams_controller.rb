class TeamsController < ApplicationController

	# Before Action
	before_action :get_user_session, only: :index

	def index
		@team = Team.new
	end

end
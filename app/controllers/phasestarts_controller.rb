class PhasestartsController < ApplicationController

	# Before Action
	before_action :get_user_session, only: :index

	def index
		@phasestart = Phasestart.new
		@phase      = Phase.find(params[:id]) 
	end

	def create

	end
end
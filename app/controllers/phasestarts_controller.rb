class PhasestartsController < ApplicationController

	# Before Action
	before_action :get_user_session, only: :index

	def index
		@key_master = User.new
		@phasestart = Phasestart.new
		@phase      = Phase.find(params[:id]) 
	end

	def startplayer
		user = get_user_session()
		team = Phasestart.new.phasestart?(user.id)

		if team 
			# INICIA A FASE
		else
			# NAO POSSUI TIME
		end
	end

	def create

	end
end
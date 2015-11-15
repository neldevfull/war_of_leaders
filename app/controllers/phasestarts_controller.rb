class PhasestartsController < ApplicationController

	# Before Action
	before_action :get_user_session, 
		only: [:new, :show]

	def new
		@key_master = params[:key_master]
		@phasestart = Phasestart.new
		@phase      = Phase.find(params[:id]) 
	end

	def startplayer
		user       = get_user_session()
		key_master = params[:key_master]
		phasestart = Phasestart.new.phasestart?(
			key_master, user.id)

		if phasestart.present? 
			game_id  = phasestart[0]["game_id"]
			phase_id = phasestart[0]["phase_id"]

			redirect_to new_plays_path(
				key_master, game_id, phase_id)
		else
			redirect_to show_phasestarts_path
		end
	end

	def create
		user       = get_user_session()
		phasestart = Phasestart.new
		phasestart.key_master = params[:key_master]
		phasestart.phase_id   = params[:phase_id]
		phasestart.user_id    = user.id
		phasestart.day        = params[:day]
		phasestart.time       = params[:time]

		if phasestart.save
			render :json => {
				:response => "Inicio",
				:error    => false
			}			
		else
			render :json => {
				:response => "Falha",
				:error    => true
			}
		end
	end

	def show
	end
end
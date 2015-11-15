class PlaysController < ApplicationController

	# Before Action
	before_action :get_user_session, 
		only: [:new, :show]
	before_action :get_color_team, only: :new

	def new
		@play           = Play.new
		@stopwatch      = true
		@questions_play = []
		@key_master     = params[:key_master]
		@phase_id       = params[:phase_id]
		questions       = Question.all()
		result    		= Game.new.game_title(@key_master) 
		@game_title 	= result.rows[0][0]

		questions.each do |question|
			@questions_play << { :question => question, 
				:answers => question.answer }
		end
	end

	def create
		count      = 0
		correct    = false
		user       = get_user_session()
		answers    = eval(params[:plays])
		key_master = params[:key_master]
		phase_id   = params[:phase_id]
		corrects   = Answer.where(:correct => true).pluck(:answer_id)

		answers.each do |answer|
			if(answer[:answer] == corrects[count])
				correct = true
			else
				correct = false
			end

			Play.create( 
				:key_master  => key_master, 
				:user_id     => user.id,
				:phase_id    => phase_id,
				:question_id => answer[:question],
				:answer_id   => answer[:answer],
				:correct     => correct) 			

			count += 1
		end

		redirect_to root_path

	end

end
class UserSession
	# Include
	include ActiveModel::Model

	# Attributes
	attr_accessor :email, :password

	# Validates
	validates_presence_of :email, :password

	# Initialize
	def initialize(session, attributes = {})
		@session  = session
		@email    = attributes[:email]
		@password = attributes[:password]
	end

	# Autheticate!
	def authenticate!
		user = User.authenticate(@email, @password)

		if user.present?
			store(user)
			true
		else
			false
		end
	end

	# Store User
	def store(user)
		@session[:user_id] = user.id
	end

	# Current User
	def current_user
		@user = User.find(@session[:user_id])
	end

	# User signed in?
	def user_session_present?
		@session[:user_id].present?
	end

	# Destroy session
	def destroy
		@session[:user_id] = nil
	end

end
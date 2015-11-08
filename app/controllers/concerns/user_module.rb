module UserModule
	extend ActiveSupport::Concern

	protected

	# Generate Token
	def generate_token
		SecureRandom.hex(3) 
	end
end

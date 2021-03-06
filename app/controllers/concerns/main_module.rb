module MainModule
	extend ActiveSupport::Concern

	protected

	# Generate Token
	def generate_token
		SecureRandom.hex(3) 
	end
	
	def success_message(action, string)
		return "Sucesso ao #{action} #{string}"
	end

	def errors_message(entity)
		errors  = ""
		counter = entity.errors.full_messages.count					
		entity.errors.full_messages.each do |message|
			errors += message
			counter -= 1
			if counter != 0
				errors += ", "
			end
		end	
		return errors
	end	
end
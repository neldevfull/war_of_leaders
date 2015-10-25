#encoding: utf-8

# Requires
require 'validations'

class User < ActiveRecord::Base
	# Includes
	include Validations

	# Passw secure
	has_secure_password

	# Constants
	BLANK_ERROR = "nao pode ficar em branco"

	# Authenticate
	def self.authenticate(email, password)
		user = self.find_by(email: email)
		if user.present?
			user.authenticate(password)			
		end
	end

	# Validate User
	validate do |user|
		# Validate Name
		unless is_present?(user.nikename)
			errors.add :nikename, BLANK_ERROR
		else
			if minimum?(user.nikename, 3)
				errors.add :nikename, minimum_error(3)
			else
				string_regex(:nikename)
			end
		end

		#Validate E-mail
		unless is_present?(user.email)
			errors.add :email, BLANK_ERROR
		else
			if minimum?(user.email, 6)
				errors.add :email, minimum_error(6)
			else
				email_regex(:email)
			end
		end

		# Validate Password and Confirmation
		if is_present?(user.password)						
			if is_present?(user.password_confirmation)
				passw_regex(:password)
				passw_regex(:password_confirmation)
			end
		end

		
		# Validate Gender
		# unless is_present?(user.gender)
		# 	errors.add :gender, BLANK_ERROR
		# else
		# 	if user.gender != "male" &&
		# 		user.gender != "female"
		# 		errors.add :gender, "nao e valido"
		# 	end
		# end

		# Validate Institution
		# unless is_present?(user.institution)
		# 	errors.add :institution, BLANK_ERROR
		# else
		# 	if minimum?(user.institution, 3)
		# 		errors.add :institution, minimum_error(3)
		# 	else
		# 		alphanumeric_regex(:institution)
		# 	end
		# end

		# Validate Course
		# unless is_present?(user.course)
		# 	errors.add :course, BLANK_ERROR
		# else
		# 	if minimum?(user.course, 3)
		# 		errors.add :course, minimum_error(3)
		# 	else
		# 		alphanumeric_regex(:course)
		# 	end
		# end

		# Validate Profile
		unless is_present?(user.profile)
			if user.profile != "master" &&
				user.profile != "player"
				errors.add :profile, "nao e valido"
			end	
		end

	end

end

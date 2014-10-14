require 'bcrypt'

class User

	include DataMapper::Resource

	property :id,					Serial
	property :email,			String, unique: true, message: "This email address has already been registered."
	property :username,		String, unique: true, message: "This username has already been chosen."
	property :name,				String
	property :password_digest,		Text

	attr_reader :password
	attr_accessor :password_confirmation

	validates_confirmation_of :password, message: "Sorry, your passwords don't match"
	validates_presence_of :username, message: "Sorry, you have not entered a Username"
	validates_format_of :email, as: :email_address
	validates_presence_of :name, message: "Sorry, you have not entered a Name"

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

	def self.authenticate(username, password)
		user = first(username: username)
		if user && BCrypt::Password.new(user.password_digest) == password
			user
		else
			nil
		end
	end
end
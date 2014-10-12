module SessionHelpers

	def sign_up(email="dave@waw.com", password="1234", password_confirmation="1234", username="Dave", name="Dave Giles")
		visit 'users/new'
		fill_in :email, with: email
		fill_in :name, with: name
		fill_in :password, with: password
		fill_in :password_confirmation, with: password_confirmation
		fill_in :username, with: username
		click_button "Sign Me Up!"
	end


end
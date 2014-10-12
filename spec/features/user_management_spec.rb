require 'spec_helper'
require './app/models/user'
require_relative 'helpers/session'

include SessionHelpers

feature "User signs up" do

	scenario "when being logged out" do
		expect { sign_up }.to change(User, :count).by(1)
		expect(page).to have_content("Welcome, Dave")
		expect(User.first.email).to eq("dave@waw.com")
	end

	scenario "with a password that doesn't match" do
		expect{ sign_up("a@a.com", "pass", "wrong", "Nick", "Nick Kent") }.to change(User, :count).by(0)
		expect(current_path).to eq('/users')
		expect(page).to have_content("Sorry, your passwords don't match")
	end

	scenario "with an email that is already registered" do
		expect { sign_up }.to change(User, :count).by(1)
		expect { sign_up }.to change(User, :count).by(0)
		expect(page).to have_content("This email address has already been registered")
	end

	scenario "with a username that is already registered" do
		expect { sign_up }.to change(User, :count).by(1)
		expect { sign_up }.to change(User, :count).by(0)
		expect(page).to have_content("This username has already been chosen")
	end

end

feature "User signs in" do

	before(:each) do
		User.create(email: "test@test.com", username: "test", name: "Test Test", password: "testing", password_confirmation: "testing")
	end

	scenario "with correct credentials" do
		visit '/'
		expect(page).not_to have_content("Welcome, test")
		sign_in("test", "testing")
		expect(page).to have_content("Welcome, test")
	end
end
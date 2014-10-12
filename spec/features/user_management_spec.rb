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

end
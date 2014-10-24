require 'spec_helper'

feature "User writes a new bant" do
	before(:each) do
		User.create(email: "test@test.com", password: "testing", password_confirmation: "testing", username: "test", name: "Test Test")
	end
	scenario "when logged in" do
		expect(Bant.count).to eq(0)
		sign_in('test', 'testing')
		click_link 'Post a Bant'
		fill_in 'content', with: "My funny bant..."
		click_button 'Post Bant'
		expect(page).to have_content("My funny bant")
		expect(Bant.count).to eq(1)
	end

end

feature "User responds to a bant" do
	before(:each) do
		User.create(email: "test@test.com", password: "testing", password_confirmation: "testing", username: "test", name: "Test Test")
	end
	scenario "which has been posted in the bay" do
		sign_in('test', 'testing')
		click_link 'Post a Bant'
		fill_in 'content', with: "My funny bant..."
		click_button 'Post Bant'
		expect(Bant.count).to eq(1)
		click_link 'Reply to this piece of Banter'
		fill_in 'content', with: "It's not that funny."
		click_button 'Post Bant'
		expect(Bant.count).to eq(2)
	end

end
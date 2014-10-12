require 'spec_helper'

feature "User browses the list of links" do

	before(:each) {
		Bant.create(content: "A really funny bant", length: 10*4)
	}

	scenario "when opening the home page" do
		visit '/'
		expect(page).to have_content("A really funny bant")
	end

end
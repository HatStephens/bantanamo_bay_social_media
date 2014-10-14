# require 'timecop'
require 'spec_helper'

feature "User browses the list of links" do

	before(:each) {
		Bant.create(content: "A really funny bant", length: 19, user: "Me Myself" )
	}

	scenario "when opening the home page" do
		visit '/'
		expect(page).to have_content("A really funny bant")
	end

	scenario "which displays the length of the Bant" do
		visit '/'
		expect(page).to have_content("19")
	end

	scenario "which displays the user who posted the Bant" do
		visit '/'
		expect(page).to have_content("Me Myself")
	end

	scenario "which displays the date which it is was posted" do
		visit '/'
		expect(page).to have_content(time_for_test)
	end

end

def time_for_test
	time = Time.new
	time_nice = time.strftime('%dth %b %Y at %H:%M')
	return time_nice
end

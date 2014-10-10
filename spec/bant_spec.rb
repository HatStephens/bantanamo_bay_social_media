require 'spec_helper'

describe Bant do

	context "checking that datamapper is working" do
		#This is not a real test, but is giving me the opportunity 
		#to play around with how datamapper works

		it 'should be created and then retrieved from the db' do

			expect(Bant.count).to eq(0)

			Bant.create(content: "My first bant...", length: 16)

			expect(Bant.count).to eq(1)

			bant = Bant.first

			expect(bant.content).to eq("My first bant...")
			expect(bant.length).to eq(16)

			bant.destroy

			expect(Bant.count).to eq(0)
		end

	end

end
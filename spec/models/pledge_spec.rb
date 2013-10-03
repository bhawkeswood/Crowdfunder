require 'spec_helper'

describe Pledge do
	it "should require a user" do
		pledge = FactoryGirl.build(:pledge, user: nil)

		pledge.should_not == pledge.save

		pledge.should have(1).errors_on(:user_id)
		expect(pledge).to have(1).errors_on(:user_id)
	end

	it "should require a project" do
		pledge = FactoryGirl.build(:pledge, project: nil)

		pledge.should_not == pledge.save

		pledge.should have(1).errors_on(:project_id)
		expect(pledge).to have(1).errors_on(:project_id)
	end 

	it "should require an amount" do
		pledge = FactoryGirl.build(:pledge, amount: nil)

		pledge.should_not == pledge.save

		pledge.should have(1).errors_on(:amount)
		expect(pledge).to have(1).errors_on(:amount)
	end

	it "should require an amount greater than 0" do
		pledge = FactoryGirl.build(:pledge, amount: -10)

		pledge.should_not ==pledge.save

		pledge.should have(1).errors_on(:amount)
		expect(pledge).to have(1).errors_on(:amount)
	end

	it "should require an amount to be an integer" do
		pledge = FactoryGirl.build(:pledge, amount: 'abc')

		pledge.should_not == pledge.save

		pledge.should have(1).errors_on(:amount)
		expect(pledge).to have(1).errors_on(:amount)
	end

end





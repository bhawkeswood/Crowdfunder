require 'spec_helper'

	describe "Pledge Listing" do 
		describe "when visiting the pledge page" do
			before(:each) do
				@project = FactoryGirl.create :project
			end

			it "should require an authenticated user" do
				visit project_path(@project)

				click_link 'Back This Project'

				expect(current_path).to eq(new_session_path)
				page.should have_content("Please login first.")
				expect(page).to have_content("Please login first.")
			end

			it "authenticated user can pledge valid amount" do
				user = setup_signed_in_user

				visit project_path(@project)
				click_link 'Back This Project'

				expect(current_path).to eq(new_project_pledge_path(@project))
				expect(Pledge.count).to eq(0)

				fill_in 'pledge[amount]', with: 100
				click_button 'Pledge Now'

				page.should have_content("Thanks for pledging")
				expect(page).to have_content("Thanks for pledging")

				pledge = Pledge.order(:id).last

				pledge.user.should == user
				expect(pledge.user).to eq(user)

				pledge.project.should == @project
				expect(pledge.project).to eq(@project)

				pledge.amount.should == 100
				expect(pledge.amount).to eq(100)
			end
		end
	end
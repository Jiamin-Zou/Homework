require 'rails_helper'

RSpec.describe "Auth", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe "the signup process" do
    it "has a new user page" do
      visit new_user_url
      expect(page).to have_content "New User"
    end

    it "redirects to the root page after signup" do
      visit new_user_url
      fill_in "Email", with: "bill@gmail.com"
      fill_in "Password", with: "password"
      click_on "Sign Up"
      # Your code here
      expect(page).to have_content "Logged in as: bill@gmail.com"
      expect(page).to have_content "Bands"
      # expect(page).to have_content "Sign Out" # submit form value doesn't count as content?
    end

    it "re-renders the sign-up page after a failed sign-up attempt" do
      # Your code here
      visit new_user_url
      fill_in "Email", with: "william@gmail.com"
      fill_in "Password", with: "pw"
      click_on "Sign Up"
      expect(page).to have_content "New User"
      expect(page).to_not have_content "Logged in as: william@gmail.com"
    end
  end
end
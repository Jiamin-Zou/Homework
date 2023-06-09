require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET /users/new (#new)" do
    it "renders the new template" do
      get new_user_url
      expect(response.body).to include("Sign Up!")
    end
  end

  describe "POST /users (#create)" do
    context "with invalid params" do
      it "validates the presence of the user's email" do
        # Your code here
        post users_url, params: {user: {email: "", password:"mypassword"}}
        expect(response.body).to include("Sign Up!")
        expect(response.body).to include("Email can&#39;t be blank") # not sure why this is not passing
      end

      it "validates that the password is at least 6 characters long" do
        # Your code here
        post users_url, params: {user: {email: "joey@testmail.com", password: "badpw"}}
        expect(response.body).to include("Sign Up!")
        expect(response.body).to include("Password is too short (minimum is 6 characters)")
      end
    end

    context "with valid params" do
      it "redirects user to root page on success" do
        # Your code here
        post users_url, params: {user: {email: "jake@testmail.com", password: "workingpassword"}}
        expect(response).to redirect_to(root_url)
      end
    end
  end
end

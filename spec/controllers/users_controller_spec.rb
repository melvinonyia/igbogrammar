require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's username and password" do
        post :create, params: { user: { username: "testing_username", password: "" } }
        expect(response).to have_http_status(422)
      end

      it "validates that the password is at least 6 characters long" do
        post :create, params: { user: { username: "testing_username", password: "short" } }
        expect(response).to have_http_status(422)
      end
    end

    context "with valid params" do
      it "renders user data" do
        post :create, params: { user: { username: "testing_username", password: "good_password" } }
        expect(response).to have_http_status(200)
        #expect(response).to render_template("show")
      end
    end

  end
end

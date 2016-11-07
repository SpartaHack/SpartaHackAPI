require 'rails_helper'

describe Api::V1::UsersController do
  let(:api_key){ FactoryGirl.create(:api_key) }
  before {request.headers["HTTP_AUTHORIZATION"] = "Token token=\"#{api_key.access_token}\"" }

  describe "GET #index" do
    context "when user token is a director's" do
      it "returns a success response" do
        user = FactoryGirl.create :director
        user_authorization_header user.auth_token
        get :index
        expect(response).to be_success
      end
    end

    context "when user token does not exist" do
      it "returns a 401 response" do
        get :index
        expect(response.status).to eq 401
      end
    end

    context "when user is not a director" do
      it "returns a 401 response" do
        user = FactoryGirl.create :user
        user_authorization_header user.auth_token
        get :index
        expect(response.status).to eq 401
      end
    end
  end

  describe "GET #show" do
    context "when user id exists" do
      before(:each) do
        @user = FactoryGirl.create :user
        user_authorization_header @user.auth_token
        get :show, params: {id: @user.id}

      end

      it "returns the information about a user on a hash" do
        user_response = json_response
        expect(user_response[:email]).to eql @user.email
      end

      it { should respond_with 200 }

      context "when a director accesses a hacker" do
        before do
          @director = FactoryGirl.create :director
          user_authorization_header @director.auth_token
          get :show, params: {id: @user.id}
        end

        it "returns the information about a user on a hash" do
          user_response = json_response
          expect(user_response[:email]).to eql @user.email
        end

        it { should respond_with 200 }
      end
    end

    context "when user id does not exist" do
      before(:each) do
        @user = FactoryGirl.create :director
        user_authorization_header @user.auth_token
        get :show, params: {id: 999999999}
      end

      it "returns an error" do
        user_response = json_response
        expect(user_response[:errors][:user][0]).to eql "does not exist"
      end

      it { should respond_with 422 }
    end
  end

  describe "POST #create" do

    context "when is successfully created" do
      before(:each) do
        @user_attributes = FactoryGirl.attributes_for :user
        post :create, params: @user_attributes
      end

      it "renders the json representation for the user record just created" do
        user_response = json_response
        expect(user_response[:email]).to eql @user_attributes[:email]
      end

      it { should respond_with 201 }
    end

    context "when is not created" do
      before(:each) do
        @invalid_user_attributes = { password: "12345678", password_confirmation: "12345678" } #notice I'm not including the email
        post :create, params: @invalid_user_attributes
      end

      it "renders an errors json" do
        user_response = json_response
        expect(user_response).to have_key(:errors)
      end

      it "renders the json errors on why the user could not be created" do
        user_response = json_response
        expect(user_response[:errors][:email]).to include "can't be blank"
        expect(user_response[:errors][:first_name]).to include "can't be blank"
        expect(user_response[:errors][:last_name]).to include "can't be blank"
      end

      it { should respond_with 422 }
    end
  end

  describe "PUT/PATCH #update" do
    before(:each) do
      @user = FactoryGirl.create :user
      user_authorization_header @user.auth_token
    end

    context "when is successfully updated" do
      before(:each) do
        patch :update, params: { id: @user.id, email: "newmail@example.com" }
      end

      it "renders the json representation for the updated user" do
        user_response = json_response
        expect(user_response[:email]).to eql "newmail@example.com"
      end

      it { should respond_with 200 }
    end

    context "when is not updated" do
      before(:each) do
        patch :update, params: { id: @user.id, email: "bademail.com" }
      end

      it "renders an errors json" do
        user_response = json_response
        expect(user_response).to have_key(:errors)
        expect(user_response[:errors][:email]).to include "is invalid"
      end

      it "renders the json errors on why the user could not be created" do
        user_response = json_response
        expect(user_response[:errors][:email]).to include "is invalid"
      end

      it { should respond_with 422 }
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @application_with_user = FactoryGirl.create :application
      user_authorization_header @application_with_user.user.auth_token
      delete :destroy, params: { id: @application_with_user.user.id }
    end

    it { should respond_with 204 }

  end

end

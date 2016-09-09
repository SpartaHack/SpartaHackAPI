require 'spec_helper'

describe Api::V1::UsersController do
  let(:api_key){ FactoryGirl.create(:api_key) }
  before {request.headers["HTTP_AUTHORIZATION"] = "Token token=\"#{api_key.access_token}\"" }

  describe "GET #show" do
    context "when user id exists" do
      before(:each) do
        @user = FactoryGirl.create :user
        get :show, {id: @user.id}

      end

      it "returns the information about a reporter on a hash" do
        user_response = json_response
        expect(user_response[:email]).to eql @user.email
      end

      it { should respond_with 200 }
    end

    context "when user id does not exist" do
      before(:each) do
        get :show, {id: 999999999}
      end

      it "returns an error" do
        user_response = json_response
        expect(user_response[:errors]).to eql "User does not exist"
      end

      it { should respond_with 422 }
    end
  end

  describe "POST #create" do

    context "when is successfully created" do
      before(:each) do
        @user_attributes = FactoryGirl.attributes_for :user
        post :create, { user: @user_attributes }
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
        post :create, { user: @invalid_user_attributes }
      end

      it "renders an errors json" do
        user_response = json_response
        expect(user_response).to have_key(:errors)
      end

      it "renders the json errors on why the user could not be created" do
        user_response = json_response
        expect(user_response[:errors][:email]).to include "can't be blank"
      end

      it { should respond_with 422 }
    end
  end

  describe "PUT/PATCH #update" do
    before(:each) do
      @user = FactoryGirl.create :user
      api_authorization_header @user.auth_token
    end

    context "when is successfully updated" do
      before(:each) do
        patch :update, { id: @user.id, email: "newmail@example.com" }
      end

      it "renders the json representation for the updated user" do
        user_response = json_response
        expect(user_response[:email]).to eql "newmail@example.com"
      end

      it { should respond_with 200 }
    end

    context "when is not updated" do
      before(:each) do
        patch :update, { id: @user.id, email: "bademail.com" }
      end

      it "renders an errors json" do
        user_response = json_response
        expect(user_response).to have_key(:errors)
      end

      it "renders the json errors on whye the user could not be created" do
        user_response = json_response
        expect(user_response[:errors][:email]).to include "is invalid"
      end

      it { should respond_with 422 }
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @user = FactoryGirl.create :user
      api_authorization_header @user.auth_token
      delete :destroy, { id: @user.id }
    end

    it { should respond_with 204 }

  end
end

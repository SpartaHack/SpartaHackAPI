require 'rails_helper'

RSpec.describe UserSerializer, :type => :serializer do

  describe "attributes" do
    before do
      @director = FactoryGirl.create :director
      @serialized = ActiveSupport::JSON.decode(serialize(@director))
    end

    it "should only include id, email, auth_token, and roles as an attribute" do
      expect(@serialized.keys).to eq ["id", "email", "first_name", "last_name", "auth_token",
      "reset_password_token", "roles", "created_at", "checked_in", "application", "rsvp"]
    end

    it "should match id as an attribute" do
      expect(@serialized["id"]).to eq @director.id
    end

    it "should match email as an attribute" do
      expect(@serialized["email"]).to eq @director.email
    end

    it "should match first name as an attribute" do
      expect(@serialized["first_name"]).to eq @director.first_name
    end

    it "should match last name as an attribute" do
      expect(@serialized["last_name"]).to eq @director.last_name
    end

    it "should match auth token as an attribute" do
      expect(@serialized["auth_token"]).to eq @director.auth_token
    end

    it "should match user to user_id" do
      roles = []
      @director.roles.each { |s| roles << s.to_s }

      expect(@serialized["roles"]).to eq roles
    end

  end
end

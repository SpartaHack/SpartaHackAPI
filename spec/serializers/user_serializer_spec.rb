require 'rails_helper'

RSpec.describe UserSerializer, :type => :serializer do

  describe "attributes" do
    before do
      @director = FactoryGirl.create :director
      @serialized = ActiveSupport::JSON.decode(serialize(@director))
    end

    it "should only include id, email, auth_token, and roles as an attribute" do
      expect(@serialized.keys).to eq ["id", "email", "auth_token", "roles"]
    end

    it "should match id as an attribute" do
      expect(@serialized["id"]).to eq @director.id
    end

    it "should match question as an attribute" do
      expect(@serialized["email"]).to eq @director.email
    end

    it "should match answer as an attribute" do
      expect(@serialized["auth_token"]).to eq @director.auth_token
    end

    it "should match user to user_id" do
      roles = []
      @director.roles.each { |s| roles << s.to_s }

      expect(@serialized["roles"]).to eq roles
    end

  end
end

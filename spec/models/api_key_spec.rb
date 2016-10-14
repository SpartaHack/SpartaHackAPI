# == Schema Information
#
# Table name: api_keys
#
#  id           :integer          not null, primary key
#  access_token :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe ApiKey, type: :model do
  
  describe "#model token creation" do
    it "generates a unique token" do
      @key = FactoryGirl.build(:api_key)
      expect(@key.access_token).to eql "auniquetoken123"
    end

    it "generates another token when one already has been taken" do
      existing_key = FactoryGirl.create(:api_key, access_token: "auniquetoken123")
      @new_key = FactoryGirl.build(:api_key)
      expect(@new_key.access_token).not_to eql existing_key.access_token
    end
  end
end

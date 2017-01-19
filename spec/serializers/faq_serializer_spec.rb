require 'rails_helper'

RSpec.describe FaqSerializer, :type => :serializer do

  describe "attributes" do
    before do
      @faq = FactoryGirl.create :faq_director
      @serialized = ActiveSupport::JSON.decode(serialize(@faq))
    end

    it "should only include id, question, answer, and user as an attribute" do
      expect(@serialized.keys).to eq ["id", "priority", "display", "question", "answer", "placement", "user"]
    end

    it "should match id as an attribute" do
      expect(@serialized["id"]).to eq @faq.id
    end

    it "should match question as an attribute" do
      expect(@serialized["question"]).to eq @faq.question
    end

    it "should match answer as an attribute" do
      expect(@serialized["answer"]).to eq @faq.answer
    end

    it "should match user to user_id" do
      expect(@serialized["user"]).to eq @faq.user_id
    end

    it "should match answer as an attribute" do
      expect(@serialized["display"]).to eq @faq.display
    end

    it "should match answer as an attribute" do
      expect(@serialized["priority"]).to eq @faq.priority
    end

  end
end

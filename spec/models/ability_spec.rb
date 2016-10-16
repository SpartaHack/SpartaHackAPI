require 'rails_helper'
require "cancan/matchers"

RSpec.describe Ability do
  context "a director should" do
    let(:user){ FactoryGirl.create(:director) }
    subject(:ability){ Ability.new(user) }

    context "be able to manage Faq" do
      %i[create read update destroy].each do |role|
        it{ is_expected.to be_able_to(role, Faq.create({:question => "question", :answer => "answer", :user_id => user.id})) }
      end
    end
  end

  context "an organizer should" do
    let(:user){ FactoryGirl.create(:organizer) }
    subject(:ability){ Ability.new(user) }

    context "be able to manage Faq" do
      %i[create read update destroy].each do |role|
        it{ is_expected.to be_able_to(role, Faq.create({:question => "question", :answer => "answer", :user_id => user.id})) }
      end
    end
  end

  context "a hacker should" do
    let(:user){ FactoryGirl.create(:user) }
    subject(:ability){ Ability.new(user) }

    context "not be able to create update destroy Faq" do
      %i[create update destroy].each do |role|
        it{ is_expected.to_not be_able_to(role, Faq.create({:question => "question", :answer => "answer", :user_id => user.id})) }
      end
    end

    context "be able to read Faq" do
      it{ is_expected.to be_able_to(:read, Faq.create({:question => "question", :answer => "answer", :user_id => user.id})) }
    end
  end

  context "a guest should" do
    let(:user){ User.new }
    subject(:ability){ Ability.new(user) }

    context "not be able to create update destroy Faq" do
      %i[create update destroy].each do |role|
        it{ is_expected.to_not be_able_to(role, Faq.create({:question => "question", :answer => "answer", :user_id => user.id})) }
      end
    end

    context "be able to read Faq" do
      it{ is_expected.to be_able_to(:read, Faq.create({:question => "question", :answer => "answer", :user_id => user.id})) }
    end
  end

end

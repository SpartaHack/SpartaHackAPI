# == Schema Information
#
# Table name: faqs
#
#  id         :integer          not null, primary key
#  question   :string
#  answer     :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_faqs_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_901529645b  (user_id => users.id)
#

FactoryGirl.define do
  factory :faq do
    question "MyStringExample"
    answer "MyTextExample"
    association :user, factory: :user

    factory :faq_director do
  		association :user, factory: :confirmed_director
  	end

    factory :faq_hacker do
  		association :user, factory: :confirmed_user
  	end

  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  auth_token             :string           default("")
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  role                   :integer
#
# Indexes
#
#  index_users_on_auth_token            (auth_token) UNIQUE
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

FactoryGirl.define do
  factory :user do
    email 					           { FFaker::Internet.email }
    password 				           "12345678"
    password_confirmation 	   "12345678"
    roles                      "hacker"

  	factory :confirmed_user do
  		confirmed_at          	 Time.now
  	end

    factory :confirmed_director do
  		confirmed_at          	 Time.now
      roles                    "director"
  	end

    factory :confirmed_organizer do
  		confirmed_at          	 Time.now
      roles                    "organizer"
  	end

  end
end

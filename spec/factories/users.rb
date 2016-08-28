FactoryGirl.define do
  factory :user do
    email 					{ FFaker::Internet.email }
    password 				"12345678"
    password_confirmation 	"12345678"
  
	factory :confirmed_user do
		confirmed_at          	Time.now
	end
  end
end
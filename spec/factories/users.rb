FactoryGirl.define do
  factory :user do
  	first_name "First name"
  	last_name "Last name"
    login "login"
    sequence(:email) { |i| "email#{i}@email.com"}
    password "password"
    admin true
  end
end

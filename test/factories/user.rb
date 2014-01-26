FactoryGirl.define do
  factory :user do
    identifier 'user@example.com'
    attributes {favorite_color: 'blue'}
  end
end
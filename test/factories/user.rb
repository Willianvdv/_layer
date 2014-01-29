FactoryGirl.define do
  factory :user do
    identifier 'user@example.com'
    properties { {favorite_color: 'blue'} }
  end
end
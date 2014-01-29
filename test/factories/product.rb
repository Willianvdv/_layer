FactoryGirl.define do
  factory :product do
    name 'product name'
    properties { {color: 'blue'} }
  end
end
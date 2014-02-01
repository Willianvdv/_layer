FactoryGirl.define do
  factory :item do
    name 'product name'
    properties { {color: 'blue'} }
  end
end
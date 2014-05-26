# -*- encoding : utf-8 -*-
FactoryGirl.define do
  factory :item do
    name 'item name'
    identifier 'sku123'
    properties { { color: 'blue' } }
  end
end

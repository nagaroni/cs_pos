# frozen_string_literal: true
FactoryGirl.define do
  factory :user do
    login 'user_dummy'
    sequence(:email) { |n| "teste#{n}@teste.com" }
    password '12345678'

    trait :other_user do
      email 'other_teste@teste.com'
    end
  end
end

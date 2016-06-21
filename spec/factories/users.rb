# frozen_string_literal: true
FactoryGirl.define do
  factory :user do
    login 'user_dummy'
    email 'teste@teste.com'
    password '12345678'
  end
end

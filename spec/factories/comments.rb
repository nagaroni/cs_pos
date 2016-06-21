# frozen_string_literal: true
FactoryGirl.define do
  factory :comment do
    body 'Um comentario qq!!'
    commentable nil
  end
end

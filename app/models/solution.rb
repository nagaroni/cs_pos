# frozen_string_literal: true
class Solution < ActiveRecord::Base
  belongs_to :started_challenge
  has_many :comments, as: :commentable
end

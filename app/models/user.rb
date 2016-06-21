# frozen_string_literal: true
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :started_challenges
  has_many :comments
  has_many :solutions, through: :started_challenges

  def points
    PointsCalculator.new(self).calculate
  end

  def solution_comments
    CommentsQuery.new(self).query
  end
end

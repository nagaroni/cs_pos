# frozen_string_literal: true
class CommentsQuery
  def initialize(user = User.last)
    @user = user
  end

  def self.query
    new.query
  end

  def arity
  end

  def query
    user.comments.where(commentable_type: 'Solution')
        .where.not(commentable_id: user.solution_ids)
  end

  private

  attr_reader :user
end

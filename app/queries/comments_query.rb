class CommentsQuery
  def initialize(user)
    @user = user
  end

  def query
    user
      .comments
      .where(commentable_type: 'Solution')
      .where.not(commentable_id: user.solution_ids)
  end

  private

  attr_reader :user
end

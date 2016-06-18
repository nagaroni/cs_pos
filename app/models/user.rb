class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :started_challenges
  has_many :comments
  has_many :solutions, through: :started_challenges

  def points
    comments_points + challenge_points
  end

  private

  def comments_points
    comments.where(commentable_type: 'Solution')
      .where.not(commentable_id: solution_ids).count * Comment::POINTS
  end

  def challenge_points
    started_challenges.inject(0) { |a, e| a + e.points }
  end
end

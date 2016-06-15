class ChallengesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_challenge, only: [:show, :finalize, :start]

  def show
  end

  def finalize
    @started_challenge = @challenge.started_by?(current_user)
    @solution = @started_challenge.finalize!
    redirect_to @solution
  end

  def start
    @challenge.started_challenges.create(user: current_user)
    redirect_to @challenge
  end

  private

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end
end

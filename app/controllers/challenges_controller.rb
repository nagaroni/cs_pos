class ChallengesController < ApplicationController
  before_action :authenticate_user!

  def show
    @challenge = Challenge.find(params[:id])
  end

  def start
    @challenge = Challenge.find(params[:id])
    @challenge.started_challenges.create(user: current_user)
    redirect_to @challenge
  end
end

# frozen_string_literal: true
class ChallengesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_challenge, only: [:show, :complete, :start]

  def show
  end

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.create(challenge_params)
    respond_with @challenge
  end

  def complete
    completer = ChallengeCompleter.new
    finalized_challenge = completer.complete(@challenge, current_user)
    redirect_to finalized_challenge.solution
  end

  def start
    @challenge.started_challenges.create(user: current_user)
    redirect_to @challenge
  end

  private

  def challenge_params
    params.require(:challenge).permit(:title, :points, :description)
  end

  def set_challenge
    @challenge = Challenge.find(params[:id])
  end
end

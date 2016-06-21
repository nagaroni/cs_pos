# frozen_string_literal: true
class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @challenge = Challenge.find(params[:challenge_id])
    @challenge.comments
              .create(body: params[:comment][:body], user: current_user)
    redirect_to @challenge
  end
end

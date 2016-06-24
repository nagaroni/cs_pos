# frozen_string_literal: true
class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    redirect_to current_user.comments
    .create(commentable_type: params[:comment][:commentable_type],
    commentable_id: params[:comment][:commentable_id],
    body: params[:comment][:body]
    ).commentable
  end
end

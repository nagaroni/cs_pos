# frozen_string_literal: true
class SolutionsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize!, only: [:show]

  def show
  end

  private

  def solution
    @solution = Solution.find(params[:id])
  end

  def authorize!
    unless SolutionAuthorizer.new(current_user, solution).authorized?
      redirect_to root_path
    end
  end
end

class SolutionsController < ApplicationController
  def show
    @solution = Solution.find(params[:id])
  end
end

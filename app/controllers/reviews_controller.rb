class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @review.ruby_gem_id = params[:ruby_gem_id]
    if @review.save
      flash[:notice] = "Success"
      redirect_to ruby_gem_path(@review.ruby_gem_id)
    else
      flash[:notice] = "There was an error"
      render "ruby_gems/#{@review.ruby_gem_id}"
    end

  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end

end

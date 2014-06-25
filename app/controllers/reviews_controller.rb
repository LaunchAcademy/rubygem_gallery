class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @reviews = Review.all.order(created_at: :desc)
    @ruby_gem = RubyGem.find(params[:ruby_gem_id])
    @review.ruby_gem = @ruby_gem
    if @review.save
      flash[:notice] = "Success"
      redirect_to ruby_gem_path(@ruby_gem)
    else
      flash[:notice] = "There was an error"
      render "ruby_gems/show"
    end

  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end

end

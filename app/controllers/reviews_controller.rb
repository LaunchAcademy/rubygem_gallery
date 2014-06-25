class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @reviews = Review.all.order(created_at: :desc)
    @ruby_gem = RubyGem.find(params[:ruby_gem_id])
    @review.ruby_gem = @ruby_gem
    @review.user_id = current_user.id

    if signed_in?
      if @review.save
        flash[:notice] = "Success"
        redirect_to ruby_gem_path(@ruby_gem)
      else
        flash[:notice] = "There was an error"
        render "ruby_gems/show"
      end
    else
      flash[:notice] = "You must be signed in to review this gem."
      redirect_to new_user_registration_path
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @ruby_gem = @review.ruby_gem
    @review.ruby_gem_id = @ruby_gem.id

    if @review.update(review_params)
      flash[:notice] = "Success"
      redirect_to ruby_gem_path(@ruby_gem)
    else
      flash.now[:notice] = "Error"
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @ruby_gem = @review.ruby_gem
    if @review.destroy
      flash[:notice] = "Deleted"
      redirect_to ruby_gem_path(@ruby_gem)
    else
      flash[:notice] = "Error"
      redirect_to ruby_gem_path(@ruby_gem)
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body)
  end

end

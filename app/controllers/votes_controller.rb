class VotesController < ApplicationController
  def create
    @vote = Vote.new(vote_params)
    @vote.review = Review.find(params[:review_id])
    @ruby_gem = @vote.review.ruby_gem
    if @vote.save
      flash[:notice] = 'Success'
      redirect_to ruby_gem_path(@ruby_gem)
    else
      flash[:notice] = 'Vote not saved'
      redirect_to ruby_gem_path(@ruby_gem)
    end
  end

  def update
    @vote = Vote.where(review_id: params[:review_id], user: current_user).first
    @ruby_gem = @vote.review.ruby_gem
    if @vote.update_attribute(:direction, vote_params[:direction])
      flash[:notice] = 'Success'
      redirect_to ruby_gem_path(@ruby_gem)
    else
      flash[:notice] = 'Vote not saved'
      redirect_to ruby_gem_path(@ruby_gem)
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:direction).merge(user: current_user)
  end
end

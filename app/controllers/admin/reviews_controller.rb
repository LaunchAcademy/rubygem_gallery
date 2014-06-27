module Admin
  class ReviewsController < ApplicationController
    before_action :authorize_admin

    def index
      @reviews = Review.all
    end

    def destroy
      @review = Review.find(params[:id])
      if @review.destroy
        flash[:notice] = 'Deleted'
        redirect_to admin_reviews_path
      else
        flash[:notice] = 'Error'
        render :index
      end
    end

    private

    def authorize_admin
      if signed_in?
        if current_user.role != 'admin'
          flash[:notice] = 'You are not authorized to do that.'
          redirect_to '/'
        end
      else
        flash[:notice] = 'You need to sign in to do that.'
        redirect_to '/'
      end
    end
  end
end

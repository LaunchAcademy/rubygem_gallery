class RubyGemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @ruby_gems = RubyGem.all
  end

  def show
    @ruby_gem = RubyGem.find(params[:id])
    @review = Review.new
    @vote = Vote.new
    @reviews = Review.where(ruby_gem: @ruby_gem).to_a.sort_by(&:vote_count).reverse
  end

  def new
    @ruby_gem = RubyGem.new
  end

  def create
    @ruby_gem = RubyGem.new(ruby_gem_params)
    @ruby_gem.user = current_user
    if @ruby_gem.save
      flash[:notice] = 'Success'
      redirect_to ruby_gems_path
    else
      flash.now[:notice] = 'Error'
      render :new
    end
  end

  def edit
    @ruby_gem = RubyGem.find(params[:id])
    authorize_to_edit
  end

  def update
    @ruby_gem = RubyGem.find(params[:id])
    authorize_to_edit
    if @ruby_gem.update(ruby_gem_params)
      flash[:notice] = 'Success'
      redirect_to ruby_gem_path(@ruby_gem)
    else
      flash.now[:notice] = 'Error'
      render :edit
    end
  end

  def destroy
    @ruby_gem = RubyGem.find(params[:id])
    authorize_to_edit
    if @ruby_gem.destroy
      flash[:notice] = 'Deleted'
      redirect_to ruby_gems_path
    else
      flash[:notice] = 'Error'
      render :show
    end
  end

  private

  def ruby_gem_params
    params.require(:ruby_gem).permit(:name, :description)
  end

  def authorize_to_edit
    if current_user != @ruby_gem.user || current_user.role != 'admin'
      flash[:notice] = 'You are not authorized to do that.'
    end
  end
end

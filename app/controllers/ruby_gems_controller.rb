class RubyGemsController < ApplicationController
  def index
    @ruby_gems = RubyGem.all
  end

  def show
    @ruby_gem = RubyGem.find(params[:id])
    @review = Review.new
    @reviews = @ruby_gem.reviews
  end

  def new
    @ruby_gem = RubyGem.new
  end

  def create
    @ruby_gem = RubyGem.new(ruby_gem_params)
    if @ruby_gem.save
      flash[:notice] = "Success"
      redirect_to ruby_gems_path
    else
      flash.now[:notice] = "Error"
      render :new
    end
  end

  def edit
    @ruby_gem = RubyGem.find(params[:id])
  end

  def update
    @ruby_gem = RubyGem.find(params[:id])
    if @ruby_gem.update(ruby_gem_params)
      flash[:notice] = "Success"
      redirect_to ruby_gem_path(@ruby_gem)
    else
      flash.now[:notice] = "Error"
      render :edit
    end
  end

  def destroy
    @ruby_gem = RubyGem.find(params[:id])
    if @ruby_gem.destroy
      flash[:notice] = "Deleted"
      redirect_to ruby_gems_path
    else
      flash[:notice] = "Error"
      render :show
    end
  end

  private

  def ruby_gem_params
    params.require(:ruby_gem).permit(:name, :description)
  end
end

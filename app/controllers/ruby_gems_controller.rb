class RubyGemsController < ApplicationController
  def index
    @ruby_gems = RubyGem.all
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
      render :new
    end
  end

  private

  def ruby_gem_params
    params.require(:ruby_gem).permit(:name, :description)
  end
end

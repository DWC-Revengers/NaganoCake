class Admin::SweetsController < ApplicationController
  def index
    @sweets = Sweet.all.page(params[:page]).per(10)
  end

  def new
    @sweet = Sweet.new
    @genres = Genre.all
  end

  def create
    @sweet = Sweet.new(sweet_params)
    @sweet.save
    redirect_to admin_sweets_path
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def sweet_params
    params.require(:sweet).permit(:name, :introduction, :unit_price, :image, :sale_status, :genre_id)
  end

end

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
    redirect_to admin_sweet_path(@sweet.id)
  end

  def show
    @sweet = Sweet.find(params[:id])
  end

  def edit
    @sweet = Sweet.find(params[:id])
    @genres = Genre.all
  end

  def update
    @sweet = Sweet.find(params[:id])
    @sweet.update(sweet_params)
    redirect_to admin_sweet_path(@sweet.id)
  end

  private

  def sweet_params
    params.require(:sweet).permit(:name, :introduction, :unit_price, :image, :sale_status, :genre_id)
  end

end

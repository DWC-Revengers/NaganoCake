class Public::SweetsController < ApplicationController
  
  def index
    @sweets = Sweet.all.page(params[:page]).reverse_order.per(8)
  end

  def show
    @sweet = Sweet.find(params[:id])
    @add_item = CartItem.new
  end
  
end

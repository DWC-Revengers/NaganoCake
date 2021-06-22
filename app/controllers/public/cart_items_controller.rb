class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!

  def create
    @sweet = Sweet.all
    add_item = current_customer.cart_items.new(cart_item_params)
    add_item.save
    redirect_to public_cart_items_path

  end

  def index
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  private
  
  def cart_item_params
  end

end

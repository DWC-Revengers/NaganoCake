class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!

  def create
    @sweet = Sweet.all
    add_item = current_customer.cart_items.new(cart_item_params)
    add_item.save
    redirect_to public_cart_items_path

  end

  def index
    @cart_items = CartItem.all
  end

  def update
    item = CartItem.find(params[:id])
    item.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  def destroy
    item = CartItem.find(params[:id])
    item.destroy
    redirect_to public_cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to public_cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:sweet_id, :amount)
  end

end

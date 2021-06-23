class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!

  def create
    cart_item = current_customer.cart_items.new(cart_item_params)
    if cart_item = current_customer.cart_items.find_by(sweet_id: params[:cart_item][:sweet_id])
      cart_item.amount += params[:cart_item][:amount].to_i
      cart_item.save
      redirect_to public_cart_items_path
    else
      cart_item = current_customer.cart_items.new(cart_item_params)
      cart_item.save
      redirect_to public_cart_items_path
    end
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

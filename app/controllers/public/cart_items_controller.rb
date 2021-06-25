class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!

  def create
    cart_item = current_customer.cart_items.new(cart_item_params)
    @test = current_customer.cart_items.find_by(sweet_id: params[:cart_item][:sweet_id])
    if @test.present?
      @test.amount += params[:cart_item][:amount].to_i
      @test.save
      redirect_to public_cart_items_path, notice: 'カートに商品が追加されました'
    else
      cart_item.save
      redirect_to public_cart_items_path, notice: 'カートに商品が追加されました'
    end
  end

  def index
    @cart_items = current_customer.cart_items
  end

  def update
    item = CartItem.find(params[:id])
    item.update(cart_item_params)
    redirect_to public_cart_items_path, notice: 'カート内の商品が変更されました'
  end

  def destroy
    item = CartItem.find(params[:id])
    item.destroy
    redirect_to public_cart_items_path, notice: 'カート内の商品が削除されました'
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to public_cart_items_path, notice: 'カート内の全ての商品が削除されました'
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:sweet_id, :amount)
  end

end

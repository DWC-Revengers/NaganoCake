class Admin::OrdersController < ApplicationController
  def index
    if params[:address] == "0"
      @orders = Order.all.page(params[:page]).per(10)
    else
      @orders = Order.where(customer_id: params[:address]).page(params[:page]).per(10)
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_sweets = @order.order_sweets
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status == "入金確認"
      @order.order_sweets.each do |order_sweet|
        order_sweet.update(making_status: "制作待ち")
      end
    end
    redirect_to admin_order_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end

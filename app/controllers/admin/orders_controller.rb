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
    @sum = 0
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order.id)
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end

end

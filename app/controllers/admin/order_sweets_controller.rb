class Admin::OrderSweetsController < ApplicationController
  def update
    @order_sweets = OrderSweet.find(params[:id])
    @order_sweets.update(order_sweet_params)
    redirect_to admin_order_path(@order_sweets.order_id)
  end

  private

  def order_sweet_params
    params.require(:order_sweet).permit(:making_status, :sweet_id, :order_id, :amount, :sub_price)
  end

end

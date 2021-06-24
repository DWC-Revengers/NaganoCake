class Admin::OrderSweetsController < ApplicationController
  def update
    @order_sweet = OrderSweet.find(params[:id])
    @order_sweet.update(order_sweet_params)
    redirect_to admin_order_path(@order.id)
  end
  
  private
  
  def order_sweet_params
    params.require(:order_sweet).permit(:making_status)
  end
  
end

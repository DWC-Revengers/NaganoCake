class Admin::OrderSweetsController < ApplicationController
  def update
    @order_sweet = OrderSweet.find(params[:id])
    @order = @order_sweet.order
    @order_sweet.update(order_sweet_params)
    if params[:order_sweet][:making_status] == "製作中"
      @order.update(status: "製作中")
    end
    if @order.order_sweets.all?{ |order_sweet| order_sweet.making_status == "製作完了"}
      @order.update(status: "発送準備中")
    end
    redirect_to admin_order_path(@order_sweet.order_id)
  end

  private

  def order_sweet_params
    params.require(:order_sweet).permit(:making_status, :sweet_id, :order_id, :amount, :sub_price)
  end

end

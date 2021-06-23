class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def check
    if params[:order][:payment_method] =="0"

    elsif params[:order][:payment_method] =="1"

    end

    if params[:order][:address] == "residence"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.family_name + current_customer.first_name
    end
  end

  def create
  end

  def complete
  end

  def index
  end

  def show
  end
end

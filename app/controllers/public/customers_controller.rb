class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to public_customer_path
  end

  def hide
  end

  def withdraw
  end

  private

  def customer_params
    params.require(:customer).permit(:family_name,:first_name,:family_name_kana,:first_name_kana,:postal_code,:adress,:phone_number,:email)
  end
end

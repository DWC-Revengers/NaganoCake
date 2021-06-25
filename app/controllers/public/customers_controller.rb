class Public::CustomersController < ApplicationController

  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to public_customer_path, notice: '会員情報を更新しました'
  end

  def hide
    @customer = Customer.find(params[:id])
  end

  def withdraw
    @customer = Customer.find(params[:id])
    @customer.update(is_deleted: true)
    reset_session
    redirect_to public_root_path, notice: 'ご利用ありがとうございました'
  end

  private

  def customer_params
    params.require(:customer).permit(:family_name,:first_name,:family_name_kana,:first_name_kana,:postal_code,:address,:phone_number,:email,:is_deleted)
  end
end

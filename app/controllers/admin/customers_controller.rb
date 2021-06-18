class Admin::CustomersController < ApplicationController
  def index
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  end

  def update
  end
  
  private
  
  def customer_parms
    params.require(:customer).permit(:family_name,:first_name,:family_name_kana,:first_name_kana,:postal_code,:adress,:phone_number,:email,:is_deleted)
  end
end

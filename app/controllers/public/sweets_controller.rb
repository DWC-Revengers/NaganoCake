class Public::SweetsController < ApplicationController
  def index
    @sweets = Sweet.page(params[:page]).reverse_order.per(8)
  end

  def show
  end
end

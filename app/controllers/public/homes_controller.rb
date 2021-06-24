class Public::HomesController < ApplicationController
  def top
    @sweets = Sweet.all
  end

  def about
  end
end

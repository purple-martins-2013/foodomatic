class BasketController < ApplicationController

  def show
    @basket = current_user.basket
  end

end

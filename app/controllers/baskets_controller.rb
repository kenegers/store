class BasketsController < ApplicationController
  before_action :authenticate_user!

  def show
  	if current_user.basket.id.to_s == params[:id] || current_user.admin == true
  	  @basket = Basket.find_by(id:params[:id])
  	else
  	  redirect_to root_path
  	end
  end
end

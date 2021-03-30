class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin?, only: [:edit, :update, :destroy]

  def index
  	@items = Item.all
  end

  def new
  	@item = Item.new
  end

  def create
  	@item = Item.new(item_params)

  	if @item.save
  	  redirect_to item_path(@item)
  	else
  	  render :new
  	end
  end

  def show
  	@item = Item.find_by(id: params[:id])
  end

  def edit
  	@item = Item.find_by(id: params[:id])
  end

  def update
  	@item = Item.find_by(id: params[:id])

  	if @item.update(item_params)
  	  redirect_to item_path(@item)
  	else
  	  render :edit
  	end
  end

  def destroy
  	@item = Item.find_by(id: params[:id])
  	@item.destroy

  	if @item.destroyed?
  	  redirect_to items_path
  	else
      redirect_to item_path(@item)
  	end
  end

  def add_item_to_basket
    current_user.basket.items << Item.find_by(id: params[:id])
  	redirect_to basket_path(current_user.basket)
  end

  private

  def item_params
  	params.require(:item).permit(:name, :description)
  end
end

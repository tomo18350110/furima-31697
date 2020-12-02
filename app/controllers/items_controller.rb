class ItemsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, only: [:new]
  # def index
  #   @items = Item.all
  # end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :image, :explanation, :category_id, :condition_id, :shipping_charges_id, :shipping_area_id, :days_to_ship_id, :item_price).merge(user_id: current_user.id)
  end

  # def move_to_index
  #   redirect_to action: :index unless user_signed_in?
  # end
end

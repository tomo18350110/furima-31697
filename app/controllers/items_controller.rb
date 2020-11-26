class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
    @items = Item.all
  end

  def new
    @items = Item.new

  def move_to_index
    redirect_to action: :index unless user_sigbed_in?
  end


  private

  def item_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user_id)
  end
  
end

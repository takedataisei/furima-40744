class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :item_detail, :price, :genre_id, :item_condition_id, :image,
                                 :shipping_cost_burden_id, :prefecture_id, :shipping_day_id).merge(user_id: current_user.id)
  end
end

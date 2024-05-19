class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :move_to_root, only: [:edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.order(created_at: :DESC)
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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :item_detail, :price, :genre_id, :item_condition_id, :image,
                                 :shipping_cost_burden_id, :prefecture_id, :shipping_day_id).merge(user_id: current_user.id)
  end

  def move_to_root
    redirect_to root_path if Item.find(params[:id]).user_id != current_user.id
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

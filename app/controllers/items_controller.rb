class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_root, only: [:edit]

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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :item_detail, :price, :genre_id, :item_condition_id, :image,
                                 :shipping_cost_burden_id, :prefecture_id, :shipping_day_id).merge(user_id: current_user.id)
  end

  def move_to_root
    redirect_to root_path if Item.find(params[:id]).user_id != current_user.id
  end
end

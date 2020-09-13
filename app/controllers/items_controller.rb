class ItemsController < ApplicationController
  before_action(:move_to_index, except: [:index,:show])
  before_action(:find_item, only:[:edit,:update,:show])

  def index
    @items = Item.all().order(created_at: :DESC )
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if (@item.save)
      redirect_to action: 'index' #成功の場合
    else
      render 'new' #失敗の場合
    end
  end

  def edit
  end

  def update
    item = @item.update(items_params)
    if item     # 成功の場合
      redirect_to action: 'show'
    else            # 失敗の場合
      render 'edit'
    end
  end

  def destroy
    Item.find(params[:id]).destroy
    redirect_to action: 'index'
  end

  def show
  end

  private
  def items_params
    params.require(:item).permit(:name, :goods, :image, :shipper_comment, :category_id, :condition_id, :delivery_fee_id, :origin_area_id, :shipment_date_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def find_item
    @item = Item.find(params[:id])
  end

end

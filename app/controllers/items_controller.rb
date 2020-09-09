class ItemsController < ApplicationController
  before_action(:move_to_index, except: [:index])

  def index
    @items = Item.all()
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(items_params)
    if @item.save!
    # binding.pry
    redirect_to :action => 'index'
    end

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

end

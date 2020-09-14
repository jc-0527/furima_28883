# require '/app/forms/purchase_info'

class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase_info = PurchaseInfo.new
  end

  def create
    # @purchase_info = PurchaseInfo.new(db_params)
    # @purchase_info.save
    
    @purchase_info = PurchaseInfo.new()

    if @purchase_info.valid?
      pay_item
      if ( @purchase_info.save(db_params) )
        return redirect_to root_path
      else
        render 'order'
      end
    end
  end

  private

  def order_params
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def db_params
    params.require(:purchase_info).permit(:postal_code, :prefectures, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end

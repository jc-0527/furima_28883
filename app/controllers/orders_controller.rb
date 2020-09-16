class OrdersController < ApplicationController
  before_action(:authenticate_user!)
  before_action(:move_to_items_index)
 
  def index
    @item = Item.find(params[:item_id])
    @purchase_info = PurchaseInfo.new
  end

  def create
    @item =  Item.find(params[:item_id])
    @purchase_info = PurchaseInfo.new(db_params)
    
    # バリデーションが正常かつ購入管理テーブルと配送先テーブルの両方に情報を正常に保存できたとき
    if ( @purchase_info.valid? && @purchase_info.save )
      pay_item
      return redirect_to root_path  # メイン画面に戻る
    # それ以外
    else
      render 'index'  # 購入内容の確認画面に戻る
    end
  end

  private

  def pay_item
    item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    ls = Payjp::Charge.create(
      amount: item.price,               # 商品の値段
      card: db_params[:token],          # カードトークン
      currency: 'jpy'                   # 通貨の種類(日本円)
    )
  end

  def db_params
    params.require(:purchase_info).permit(:postal_code, :prefectures, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def move_to_items_index
    # ログインユーザーと出品者が同じ場合 または、その商品が購入されている場合
    if ( (current_user.id == Item.find(params[:item_id]).user_id) ||  (Item.find(params[:item_id]).purchase != nil) )
      redirect_to(controller: 'items', action: 'index')           # メイン画面に戻る
    end
  end

end

class PurchaseInfo

   include ActiveModel::Model
   attr_accessor :user_id, :item_id, :postal_code, :prefecture, :municipalities, :address, :building_name, :phone_number, :purchase_id

 # 切り取ったバリデーションをここに移動
  with_options presence: true do
  end

  def save(params)
    binding.pry
    # 配送先の情報を保存
    ShippingAddress.create(user_id: params[user_id], item_id: params[item_id])
    # 購入管理情報を保存
    Purchase.create(postal_code: params[:postal_code], prefectures: params[:prefectures], municipalities: params[:municipalities], address: params[:address], building_name: params[:building_name], phone_number: params[:phone_number])
  end

end
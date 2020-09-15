class PurchaseInfo

   include ActiveModel::Model
   attr_accessor :user_id, :item_id, :postal_code, :prefectures, :municipalities, :address, :building_name, :phone_number, :purchase_id, :token

 # 切り取ったバリデーションをここに移動
  with_options presence: true do
  end


  def save
    binding.pry
    begin
      # 配送先の情報を保存
      purchase = Purchase.create(user_id: user_id, item_id: item_id)
      # 購入管理情報を保存
      shippingaddress = ShippingAddress.create(postal_code: postal_code, prefectures: prefectures, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
    rescue => exception
      puts "DB_ERROR"
    end
  end
end
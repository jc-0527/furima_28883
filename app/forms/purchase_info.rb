class PurchaseInfo

   include ActiveModel::Model
   attr_accessor :user_id, :item_id, :postal_code, :prefectures, :municipalities, :address, :building_name, :phone_number, :purchase_id, :token

 # 切り取ったバリデーションをここに移動
  with_options presence: true do
    validates :postal_code        # 郵便番号
    validates :municipalities     # 市区町村
    validates :address            # 番地
    validates :phone_number       # 電話番号
    validates :token              # トークン
  end

  # 都道府県のバリデーション
  validates :prefectures, numericality: { other_than: 1 , message: 'Select'}

  # 郵便番号のバリデーション
  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
  validates_format_of :postal_code, with: POSTAL_CODE_REGEX, message: "Input correctly" 
  
  # 電話番号のバリデーション
  PHONE_NUMBER_REGEX = /\A[0-9]+\z/
  validates_format_of :phone_number, with: PHONE_NUMBER_REGEX, message: "must be half-width numbers" 
  validates :phone_number, length: {maximum: 11}


  def save
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
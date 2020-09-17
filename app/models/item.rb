class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :origin_area
  belongs_to_active_hash :shipment_date

  has_one_attached :image

  # 出品画像が存在しているかどうか
  validate :image_presence
  # 商品名のバリデーション
  validates :goods, presence: true
  # 商品の説明のバリデーション
  validates :shipper_comment, presence: true
  # バリデーション
  with_options numericality: { other_than: 1 , message: 'Select'} do
    validates :category_id        # カテゴリー
    validates :condition_id       # 商品の状態
    validates :delivery_fee_id    # 配送料の負担
    validates :origin_area_id     # 配送元の地域
    validates :shipment_date_id   # 発送までの日数
  end
  # 価格のバリデーション
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300 , less_than_or_equal_to:	9999999 , message: 'Out of setting range'}
    
  def image_presence
    if image.attached?
      if !image.content_type.in?(%('image/jpeg image/png'))
        errors.add(:image, 'にはjpegまたはpngファイルを添付してください')
      end
    else
      errors.add(:image, "can't be blank")
    end
  end

end

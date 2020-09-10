class Item < ApplicationRecord
  belongs_to :user
  #has_one :purchase  

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
  # カテゴリーのバリデーション
  validates :category_id, numericality: { other_than: 1 , message: 'Select'}
  # 商品の状態のバリデーション
  validates :condition_id, numericality: { other_than: 1 , message: 'Select'}
  # 配送料の負担のバリデーション
  validates :delivery_fee_id, numericality: { other_than: 1 , message: 'Select'}
  # 配送元の地域のバリデーション
  validates :origin_area_id, numericality: { other_than: 1 , message: 'Select'}
  # 発送までの日数のバリデーション
  validates :shipment_date_id, numericality: { other_than: 1 , message: 'Select'}
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

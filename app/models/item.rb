class Item < ApplicationRecord
  belongs_to :user
  #has_one :purchase  

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :origin_area
  belongs_to_active_hash :shipment_date
  validates :category_id, numericality: { other_than: 1 }
end

class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :goods,           null: false, default: ""
      t.integer :price,           null: false
      t.integer :condition_id,    null: false
      t.integer :delivery_fee_id, null: false
      t.integer :origin_area_id,  null: false
      t.integer :shipment_date_id,null: false
      t.text    :shipper_comment, null: false
      t.integer :category_id,     null: false
      t.references :user,         foreign_key: true, null: false
      t.timestamps
    end
  end
end

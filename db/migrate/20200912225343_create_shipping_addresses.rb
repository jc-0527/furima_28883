class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string      :postal_code,   null: false,  default: ""
      t.integer     :prefectures,   null: false
      t.string      :municipalities,null: false,  default: ""
      t.string      :address,       null: false,  default: ""
      t.string      :building_name, default: ""
      t.string      :phone_number,  null: false,  default: ""
      t.references  :purchase,      foreign_key: true, null: false
      t.timestamps
    end
  end
end

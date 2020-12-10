class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string     :postal_code,   null: false
      t.integer    :prefecture,    null: false
      t.string     :cities,        null: false
      t.string     :adress,        null: false
      t.string     :building_name 
      t.string     :phone_number,  null: false
      t.references :purchase,      null: false, foreign_key: true
      t.timestamps
    end
  end
end

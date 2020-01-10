class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.integer :price, null: false
      t.text :info, null: false
      t.integer :status, null: false
      t.integer :postage, null: false
      t.integer :shipping, null: false
      t.string :prefecture, null: false
      t.integer :day, null: false
      t.integer :brand_id, foreign_key: true
      t.integer :category_id, foreign_key: true
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end

class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title null: false
      t.integer :price null: false
      t.text :info
      t.integer :status null:false
      t.text :postage null: false
      t.text :shipping null: false
      t.string :from null: false
      t.string :day null: false
      t.integer :brand_id foreign_key: true
      t.integer :category_id null: false, foreign_key: true
      t.integer :user_id null: false, foreign_key: true
      t.timestamps
    end
  end
end

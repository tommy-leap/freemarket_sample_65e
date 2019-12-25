class CreateUserDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :user_details do |t|
      t.string :user_id null: false, foreign_key: true
      t.string :first_name null: false
      t.string :first_kana null: false
      t.string :last_name null: false
      t.string :last_kana null: false
      t.integer :year null: false
      t.integer :month null: false
      t.integer :day null: false
      t.integer :post_num null: false
      t.string :from null: false
      t.string :municipalities null: false
      t.string :bulid_name
      t.text :comment
      t.integer :credit_num
      t.timestamps
    end
  end
end

class CreateStep1s < ActiveRecord::Migration[5.2]
  def change
    create_table :step1s do |t|
      t.string :nickname,            null: false, default: ""
      t.string :email,               null: false, default: ""
      t.string :encrypted_password,  null: false, default: ""
      t.string :last_name, null: false
      t.string :first_name, null: false
      t.string :last_kana, null: false
      t.string :first_kana, null: false
      t.integer :year, null: false
      t.integer :month, null: false
      t.integer :day, null: false
      t.timestamps
    end
  end
end

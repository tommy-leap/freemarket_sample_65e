class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :prefecture_id
      t.string :municipalities, null: false

      t.timestamps
    end
  end
end

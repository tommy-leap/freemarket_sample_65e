class CreateStep4s < ActiveRecord::Migration[5.2]
  def change
    create_table :step4s do |t|
      t.integer :card_num, null: false
      t.integer :expiration_date, null: false
      t.integer :security_code, null: false
      t.timestamps
    end
  end
end

class CreateHardware < ActiveRecord::Migration[5.0]
  def change
    create_table :hardware do |t|
      t.string :item,         null: false
      t.string :lender,       null: false
      t.string :quantity,     null: true

      t.timestamps
    end
  end
end

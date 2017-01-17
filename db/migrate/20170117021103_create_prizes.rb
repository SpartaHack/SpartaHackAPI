class CreatePrizes < ActiveRecord::Migration[5.0]
  def change
    create_table :prizes do |t|
      t.string :name,             null: false
      t.text :description,        null: false
      t.references :sponsor,      foreign_key: true,  null: true, default: nil

      t.timestamps
    end
  end
end

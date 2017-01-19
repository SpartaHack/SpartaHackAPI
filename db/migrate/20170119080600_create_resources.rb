class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
      t.string :name,             null: false
      t.string :url,              null: false
      t.references :sponsor,      foreign_key: true,  null: true, default: nil

      t.timestamps
    end
  end
end

class CreateBatches < ActiveRecord::Migration[5.0]
  def change
    create_table :batches do |t|
      t.string :token,      null: false
      t.text :hackers,      null: false, array: true

      t.timestamps
    end
  end
end

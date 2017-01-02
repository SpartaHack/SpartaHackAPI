class CreateInstallations < ActiveRecord::Migration[5.0]
  def change
    create_table :installations do |t|
      t.references :user, foreign_key: true, unique: false
      t.string :device_type
      t.text :token

      t.timestamps
    end
  end
end

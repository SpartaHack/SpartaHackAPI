class CreateRsvps < ActiveRecord::Migration[5.0]
  def change
    create_table :rsvps do |t|
      t.references :user, foreign_key: true,  null: false, unique: true
      t.string :attending,                    null: false
      t.text :dietary_restrictions
      t.string :other_dietary_restrictions
      t.text :resume
      t.string :shirt_size
      t.string :carpool_sharing
      t.string :jobs

      t.timestamps
    end
  end
end

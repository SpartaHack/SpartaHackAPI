class CreateAnnouncements < ActiveRecord::Migration[5.0]
  def change
    create_table :announcements do |t|
      t.string :title,         null: false
      t.text :description,     null: false
      t.boolean :pinned,       null: false

      t.timestamps
    end
  end
end

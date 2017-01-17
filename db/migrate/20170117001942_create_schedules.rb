class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.string :title,          null: false
      t.text :description,      null: false
      t.datetime :time,         null: false
      t.string :location,       null: false

      t.timestamps
    end
  end
end

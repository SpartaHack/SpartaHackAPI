class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.references :user, foreign_key: true,  null: false, unique: true
      t.integer :birth_day,                   null: false
      t.integer :birth_month,                 null: false
      t.integer :birth_year,                  null: false
      t.string :education,                    null: false
      t.string :university,                   null: false
      t.string :other_university
      t.string :travel_origin,                null: false
      t.string :graduation_season,            null: false
      t.integer :graduation_year,             null: false
      t.text :major,                          null: false, array: true
      t.integer :hackathons,                  null: false
      t.string :github
      t.string :linkedin
      t.string :website
      t.string :devpost
      t.string :other_link
      t.text :statement

      t.timestamps
    end
  end
end

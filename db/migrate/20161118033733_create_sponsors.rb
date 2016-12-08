class CreateSponsors < ActiveRecord::Migration[5.0]
  def change
    create_table :sponsors do |t|
      t.string :name,                           null: false
      t.string :level,                          null: false
      t.string :url,                            null: false
      t.text :logo_svg_light,                   null: false
      t.text :logo_svg_dark
      t.text :logo_png_light,                   null: false
      t.text :logo_png_dark

      t.timestamps
    end
  end
end

class AddColumnsToApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :race, :text, :array => true
    add_column :applications, :gender, :string
  end
end

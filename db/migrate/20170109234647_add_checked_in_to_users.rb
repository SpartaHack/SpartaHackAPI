class AddCheckedInToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :checked_in, :boolean, null: false, default: false
  end
end

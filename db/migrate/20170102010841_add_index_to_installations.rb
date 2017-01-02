class AddIndexToInstallations < ActiveRecord::Migration[5.0]
  def change
    add_index :installations, :token, unique: true
  end
end

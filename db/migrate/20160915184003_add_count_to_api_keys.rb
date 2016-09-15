class AddCountToApiKeys < ActiveRecord::Migration[5.0]
  def change
    add_column :api_keys, :count, :bigint, :null => false, :default => 0
  end
end

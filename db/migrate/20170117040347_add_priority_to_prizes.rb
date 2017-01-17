class AddPriorityToPrizes < ActiveRecord::Migration[5.0]
  def change
    add_column :prizes, :priority, :integer, null: false
  end
end

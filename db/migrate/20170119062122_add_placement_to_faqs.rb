class AddPlacementToFaqs < ActiveRecord::Migration[5.0]
  def change
    add_column :faqs, :placement, :string, default: "home", null: false
  end
end

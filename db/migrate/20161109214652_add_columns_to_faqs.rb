class AddColumnsToFaqs < ActiveRecord::Migration[5.0]
  def change
    add_column :faqs, :display, :boolean, :null => false
    add_column :faqs, :priority, :integer, :null => false
  end
end

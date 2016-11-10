class AddColumnsToFaqs < ActiveRecord::Migration[5.0]
  def change
    add_column :faqs, :display, :boolean, :null => false
    change_column_null :faqs, :display, false
    add_column :faqs, :priority, :integer, :null => false
    change_column_null :faqs, :priority, false
  end
end

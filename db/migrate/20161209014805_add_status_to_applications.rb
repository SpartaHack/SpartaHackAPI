class AddStatusToApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :status, :string
    add_column :applications, :accepted_date, :datetime
  end
end

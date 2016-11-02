class AddOutsideNorthAmericaToApplications < ActiveRecord::Migration[5.0]
  def change
    add_column :applications, :outside_north_america, :string
  end
end

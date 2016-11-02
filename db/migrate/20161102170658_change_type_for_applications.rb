class ChangeTypeForApplications < ActiveRecord::Migration[5.0]
  def change
    change_column_null(:applications, :university, true)
    change_column_null(:applications, :travel_origin, true)
    change_column_null(:applications, :major, true)
  end
end

class CreateGeoIps < ActiveRecord::Migration[5.0]
  def change
    create_table :geo_ips do |t|
      t.inet :ip_address
      t.bigint :count, :null => false, :default => 0

      t.timestamps
    end
  end
end

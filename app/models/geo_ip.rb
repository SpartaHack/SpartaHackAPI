# == Schema Information
#
# Table name: geo_ips
#
#  id         :integer          not null, primary key
#  ip_address :inet
#  count      :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class GeoIp < ApplicationRecord
  validates :ip_address, :presence => true
end

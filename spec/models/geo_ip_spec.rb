require 'spec_helper'

RSpec.describe GeoIp, type: :model do
  it { should validate_presence_of(:ip_address) }
end

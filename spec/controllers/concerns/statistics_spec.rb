require 'rails_helper'

class Statistic
  include Statistics
end

RSpec.describe Statistics do
  let(:statistic) { Statistic.new }
  subject { statistic }

  describe "#geo_ip" do
    before do
      allow(statistic).to receive_message_chain(:request).and_return(request)
      allow(ActionDispatch::Request).to receive(:remote_ip).and_return('192.168.0.1')
    end

    it "returns the user from the authorization header" do
      statistic.geo_ip
      expect(GeoIp.find_by_ip_address("0.0.0.0").count).to eql 1

      statistic.geo_ip
      expect(GeoIp.find_by_ip_address("0.0.0.0").count).to eql 2
    end
  end

end

# == Schema Information
#
# Table name: api_keys
#
#  id           :integer          not null, primary key
#  access_token :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  count        :integer          default(0), not null
#

class ApiKey < ActiveRecord::Base
  before_create :generate_access_token
  
private
  
  def generate_access_token
    loop do 
      self.access_token = SecureRandom.hex
      break unless self.class.exists?(access_token: access_token)
    end
  end

end

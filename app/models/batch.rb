# == Schema Information
#
# Table name: batches
#
#  id         :integer          not null, primary key
#  token      :string           not null
#  hackers    :text             not null, is an Array
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Batch < ApplicationRecord

  validates :token, uniqueness: true
  validates :hackers, presence: true

  before_create :generate_batch_token!

  def generate_batch_token!
    loop do
      self.token = SecureRandom.hex(3)
      break unless self.class.exists?(token: token)
    end
  end
end

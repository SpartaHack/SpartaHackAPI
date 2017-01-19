# == Schema Information
#
# Table name: hardware
#
#  id         :integer          not null, primary key
#  item       :string           not null
#  lender     :string           not null
#  quantity   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Hardware < ApplicationRecord
  before_save :default_values

  def default_values
    self.lender ||= 'SpartaHack'
  end
end

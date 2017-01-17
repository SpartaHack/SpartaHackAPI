# == Schema Information
#
# Table name: prizes
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  description :text             not null
#  sponsor_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  priority    :integer
#
# Indexes
#
#  index_prizes_on_sponsor_id  (sponsor_id)
#
# Foreign Keys
#
#  fk_rails_9b29432781  (sponsor_id => sponsors.id)
#

class Prize < ApplicationRecord
  belongs_to :sponsor, optional: true

  validates :priority, :presence => true
end

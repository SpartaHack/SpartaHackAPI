# == Schema Information
#
# Table name: resources
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  url        :string           not null
#  sponsor_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_resources_on_sponsor_id  (sponsor_id)
#
# Foreign Keys
#
#  fk_rails_04c9bcd08f  (sponsor_id => sponsors.id)
#

class Resource < ApplicationRecord
  belongs_to :sponsor, optional: true
end

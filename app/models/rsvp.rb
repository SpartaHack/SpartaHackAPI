# == Schema Information
#
# Table name: rsvps
#
#  id                         :integer          not null, primary key
#  user_id                    :integer          not null
#  attending                  :string           not null
#  dietary_restrictions       :text
#  other_dietary_restrictions :string
#  resume                     :text
#  shirt_size                 :string
#  carpool_sharing            :string
#  jobs                       :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#
# Indexes
#
#  index_rsvps_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_4ab9d5c589  (user_id => users.id)
#

class Rsvp < ApplicationRecord
  belongs_to :user
end

# == Schema Information
#
# Table name: installations
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  device_type :string
#  token       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_installations_on_token    (token) UNIQUE
#  index_installations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_52f40fc395  (user_id => users.id)
#

class Installation < ApplicationRecord
end

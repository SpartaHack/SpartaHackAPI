# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  category   :string           not null
#  channel    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
end

# == Schema Information
#
# Table name: schedules
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :text             not null
#  time        :datetime         not null
#  location    :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Schedule < ApplicationRecord
end

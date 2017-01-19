# == Schema Information
#
# Table name: faqs
#
#  id         :integer          not null, primary key
#  question   :string
#  answer     :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  display    :boolean          not null
#  priority   :integer          not null
#  placement  :string           default("home"), not null
#
# Indexes
#
#  index_faqs_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_901529645b  (user_id => users.id)
#

class Faq < ActiveRecord::Base
  belongs_to :user

  validates :question, :presence => true
  validates :answer, :presence => true
  validates :priority, :presence => true
end

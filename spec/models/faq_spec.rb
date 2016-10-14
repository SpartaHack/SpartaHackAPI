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
#
# Indexes
#
#  index_faqs_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_901529645b  (user_id => users.id)
#

require 'rails_helper'

RSpec.describe Faq do
  before { @faq = FactoryGirl.build(:faq) }

  subject { @faq }

  it { should respond_to(:question) }
  it { should respond_to(:answer) }

  it { should be_valid }

  it { should validate_presence_of(:question) }
  it { should validate_presence_of(:answer) }

end

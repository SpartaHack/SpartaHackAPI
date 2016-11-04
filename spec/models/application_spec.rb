require 'rails_helper'

RSpec.describe Application do
  before { @application = FactoryGirl.build(:application) }

  subject { @application }

  it { should respond_to(:user_id) }
  it { should respond_to(:gender) }
  it { should respond_to(:birth_day) }
  it { should respond_to(:birth_month) }
  it { should respond_to(:birth_year) }
  it { should respond_to(:race) }
  it { should respond_to(:education) }
  it { should respond_to(:university) }
  it { should respond_to(:other_university) }
  it { should respond_to(:travel_origin) }
  it { should respond_to(:outside_north_america) }
  it { should respond_to(:graduation_season) }
  it { should respond_to(:graduation_season) }
  it { should respond_to(:major) }
  it { should respond_to(:hackathons) }
  it { should respond_to(:github) }
  it { should respond_to(:linkedin) }
  it { should respond_to(:website) }
  it { should respond_to(:devpost) }
  it { should respond_to(:other_link) }
  it { should respond_to(:statement) }

  it { should be_valid }

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:birth_day) }
  it { should validate_presence_of(:birth_month) }
  it { should validate_presence_of(:birth_year) }
  it { should validate_presence_of(:education) }
  it { should validate_presence_of(:graduation_season) }
  it { should validate_presence_of(:graduation_year) }
  it { should validate_presence_of(:hackathons) }

end

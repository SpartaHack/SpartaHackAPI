FactoryGirl.define do
  factory :application do
    association :user, factory: :user
    education "Undergraduate"
    university "Michigan State University"
    other_university ""
    outside_north_america "No"
    travel_origin "Michigan State University"
    graduation_season "Winter"
    graduation_year 2016
    birth_day 1
    birth_month 3
    birth_year 2004
    hackathons 1
    major ["Computer Science"]
    race []
    gender ""
    github "github"
    linkedin "linkedin"
    website "website"
    devpost "devpost"
    other_link "other_link"
    statement "statement"


    factory :high_school do
      university ""
      other_university ""
      major []
    end

    factory :outside_north_america do
      outside_north_america "Yes"
      travel_origin ""
    end
  end
end

class ApplicationSerializer < ActiveModel::Serializer
  attributes :id, :user, :birth_day, :birth_month, :birth_year,
    :gender, :race, :education, :university, :other_university,
    :travel_origin, :graduation_season, :graduation_year, :major,
    :hackathons, :github, :linkedin, :website, :devpost, :other_link,
    :statement

    def user
      object.user_id
    end
end

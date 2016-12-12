class RsvpSerializer < ActiveModel::Serializer
  attributes :id, :user, :attending, :dietary_restrictions,
  :other_dietary_restrictions, :shirt_size, :carpool_sharing, :jobs

  belongs_to :user

  def user
    object.user_id
  end
end

class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :auth_token,
  :reset_password_token, :roles, :created_at, :checked_in

  has_one :application
  has_one :rsvp

  def checked_in
    (object.checked_in ? 1 : 0)
  end

  #  attributes(*User.attribute_names.map(&:to_sym))
end

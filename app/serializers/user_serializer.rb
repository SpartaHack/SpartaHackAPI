class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :auth_token, :roles

  has_one :application
  has_one :rsvp
  #  attributes(*User.attribute_names.map(&:to_sym))
end

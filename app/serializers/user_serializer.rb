class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :auth_token, :roles
  #  attributes(*User.attribute_names.map(&:to_sym))
end

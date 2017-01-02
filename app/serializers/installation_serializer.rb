class InstallationSerializer < ActiveModel::Serializer
  attributes :id, :device_type, :token, :user


  def user
    object.user_id
  end

end

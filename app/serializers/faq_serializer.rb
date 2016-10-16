class FaqSerializer < ActiveModel::Serializer
  attributes :id, :question, :answer, :user

  def user
    object.user_id
  end
end

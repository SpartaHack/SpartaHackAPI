class FaqSerializer < ActiveModel::Serializer
  attributes :id, :priority, :display, :question, :answer, :user

  def user
    object.user_id
  end

  def display
    object.display
  end
end

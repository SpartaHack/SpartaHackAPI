class FaqSerializer < ActiveModel::Serializer
  attributes :id, :priority, :display, :question, :answer, :placement, :user

  def user
    object.user_id
  end

  def display
    object.display
  end
end

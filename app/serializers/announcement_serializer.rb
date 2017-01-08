class AnnouncementSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :pinned, :created_at, :updated_at

  def pinned
    (object.pinned ? 1 : 0)
  end
end

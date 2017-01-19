class ResourceSerializer < ActiveModel::Serializer
  attributes :id, :name, :url

  has_one :sponsor
end

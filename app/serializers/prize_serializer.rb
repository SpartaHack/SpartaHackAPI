class PrizeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :priority

  has_one :sponsor
end

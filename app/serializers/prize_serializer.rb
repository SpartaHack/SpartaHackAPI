class PrizeSerializer < ActiveModel::Serializer
  attributes :id, :name, :description

  has_one :sponsor
end

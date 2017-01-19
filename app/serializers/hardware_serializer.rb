class HardwareSerializer < ActiveModel::Serializer
  attributes :id, :item, :lender, :quantity
end

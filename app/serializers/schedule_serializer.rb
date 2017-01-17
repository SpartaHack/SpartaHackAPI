class ScheduleSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :time, :location, :updated_at
end

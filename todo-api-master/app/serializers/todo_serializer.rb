class TodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :completed_at
end

class ImageSerializer < ActiveModel::Serializer
  attributes :id, :name, :file, :avg_value, :theme_id
end

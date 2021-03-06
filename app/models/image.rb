class Image < ApplicationRecord
  belongs_to :theme
  scope :theme_images, -> (theme_id) {
    select('id','name','file','avg_value').where(theme_id: theme_id)
  }
  scope :find_image, -> (image_id) {
    select('id','name','file','avg_value').where(id: image_id)
  }
end

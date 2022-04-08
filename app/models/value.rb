class Value < ApplicationRecord
  belongs_to :user
  validate :user_id, :image_id, :value
end

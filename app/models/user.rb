class User < ApplicationRecord
  has_many :values, dependent: :destroy
  validate :name, :email
end

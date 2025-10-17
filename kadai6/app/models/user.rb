class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, length: { maximum: 20 }

  has_one_attached :icon
end

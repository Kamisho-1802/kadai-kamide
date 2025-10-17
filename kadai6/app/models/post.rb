class Post < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true, length: { maximum: 20 }
  validates :content, length: { maximum: 200 }

  belongs_to :user
end

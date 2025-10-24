class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

   # 🔍 Ransack用の許可リストを定義
  def self.ransackable_attributes(auth_object = nil)
    %w[title]
  end

 
end

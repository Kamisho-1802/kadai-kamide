class User < ApplicationRecord
     validates :name, presence: true
     has_many :posts, dependent: :destroy
        validates :email, presence: true, uniqueness: true
    has_secure_password
end

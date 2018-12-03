class User < ApplicationRecord
  has_secure_password
  mount_uploader :avatar, AvatarUploader
  validates :email, uniqueness: true

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end

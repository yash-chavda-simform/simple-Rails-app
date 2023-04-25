class RailsUser < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :post_comments, through: :posts, dependent: :destroy
  has_many :post_likes, through: :posts, dependent: :destroy 
end

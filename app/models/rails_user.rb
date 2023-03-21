class RailsUser < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :post_comments, through: :posts
  has_and_belongs_to_many :liked_posts, class_name: "Post" 
end

class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :rails_user
  has_many :post_comments, dependent: :destroy
  has_many :post_likes, dependent: :destroy
  def total_like
    "#{post_likes.count}  Like"
  end
end

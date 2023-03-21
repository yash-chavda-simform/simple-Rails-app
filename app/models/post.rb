class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :rails_user
  has_many :post_comments
  has_and_belongs_to_many :liking_users, class_name: "RailsUser"
  
  def total_like
    "#{liking_users.count}  Like"
  end
end

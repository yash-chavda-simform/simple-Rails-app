class PostLike < ApplicationRecord
  belongs_to :rails_user
  belongs_to :post
end

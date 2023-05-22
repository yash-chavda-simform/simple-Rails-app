class UserAction < ApplicationRecord
  mount_uploader :profile, ProfileUploader
end

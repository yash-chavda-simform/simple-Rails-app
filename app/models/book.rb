class Book < ApplicationRecord
    belongs_to :authors
    has_many :images, as: :imageable
end

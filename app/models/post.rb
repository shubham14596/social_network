class Post < ApplicationRecord
  belongs_to :user
  has_many :posts, through: :comments
end

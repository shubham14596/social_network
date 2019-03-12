class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likable, dependent: :destroy
  has_one_attached :image
  validates :content, presence: true
end

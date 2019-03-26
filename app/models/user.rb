class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :friendships
  has_many :friends, through: :friendships
  
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  scope :search_by_first_name, ->(first_name) { where('first_name LIKE ?', "%#{first_name}%") }

  def find_like(likable)
    likes.find_by(likable_id: likable.id, likable_type: likable.class.name)
  end

  def find_friendship(friend)
    friendships.find_by(friend_id: friend.id)
  end
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments
  has_many :likes

  has_many :friendships
  has_many :friends, through: :friendships

  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id"
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  def liked?(likable)
  	self.likes.find_by(likable_id: likable.id, likable_type: likable.class.name)
  end

  def friendship?(friend)
    self.friendships.find_by(friend_id: friend.id)
  end

end
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments
  has_many :likes

  def liked?(likable)
  	self.likes.find_by(likable_id: likable.id, likable_type: likable.class.name)
  end

end

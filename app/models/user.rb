class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable
  has_many :posts, foreign_key: 'user_id'
  has_many :comments
  has_many :likes, foreign_key: 'user_id'

  validates :name, presence: true, length: { minimum: 3, maximum: 20 }

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end

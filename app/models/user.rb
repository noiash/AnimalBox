class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum sex: { man: 0, woman: 1}

  mount_uploader :profile_image, ImageUploader

  has_many :pets, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :followers, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy, inverse_of: :follower
  has_many :followings, class_name: 'Relationship', foreign_key: 'following_id', dependent: :destroy, inverse_of: :following
  has_many :following_users, through: :followers, source: :following
  has_many :follower_users, through: :followings, source: :follower

  #フォローするときのメソッド
  def follow(other_user_id)
    followers.create(following_id: other_user_id)
  end
  #フォローしているかの確認メソッド
  def following?(other_user)
    following_users.include?(other_user)
  end
  #フォローを外すときのメソッド
  def unfollow(other_user_id)
    followers.destroy(following_id: other_user_id)
  end
end


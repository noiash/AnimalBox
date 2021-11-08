class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum sex: { man: 0, woman: 1}

  mount_uploader :profile_image, ImageUploader

  has_many :pets, dependent: :destroy
  has_many :posts, dependent: :destroy

end

class Pet < ApplicationRecord
  belongs_to :user

  enum sex: { man: 0, woman: 1}

  mount_uploader :profile_image, ImageUploader

end

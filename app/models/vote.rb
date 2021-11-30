class Vote < ApplicationRecord
  has_many :vote_items, dependent: :destroy


  validates :title, presence: true
  validates :content, presence: true

end

class Vote < ApplicationRecord
  has_many :vote_items

  validates :title, presence: true
  validates :content, presence: true

end

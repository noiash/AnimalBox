class VoteItem < ApplicationRecord
  has_many :vote_answers, dependent: :destroy

  belongs_to :vote

  validates :item, presence: true
  # validates :item, numericality: { less_than_or_equal_to: 10, greater_than_or_equal_to: 2 }

end

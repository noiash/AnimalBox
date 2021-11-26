class VoteItem < ApplicationRecord
  has_many :vote_answers
  belongs_to :vote

  validates :item, presence: true

end

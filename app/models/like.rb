class Like < ApplicationRecord
  belongs_to :user
  belongs_to :past, optional: true
end

class Review < ApplicationRecord
  belongs_to :cocktail
  validates :content, presence: true
  validate :rating, inclusion: { in: 0..5 }
end

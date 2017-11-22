class Review < ApplicationRecord
  belongs_to :restaurant

  validates :rating, inclusion: { in: 0..5 }

  validates :content, presence: true
  validates :rating, presence: true
  validates_numericality_of :rating

end

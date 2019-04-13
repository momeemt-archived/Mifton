class Contest < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :times, presence: true
  validates :writer, presence: true, length: { maximum: 20 }
  validates :holdingTime, presence: true
  validates :length, presence: true
  validates :rating, presence: true
  validates :penalty, presence: true
end

class DraftContest < ApplicationRecord
  validates :name, length: { maximum: 30 }
  validates :problem_1_name, length: { maximum: 30 }
  validates :problem_2_name, length: { maximum: 30 }
  validates :problem_3_name, length: { maximum: 30 }
  validates :problem_4_name, length: { maximum: 30 }
  validates :writer, length: { maximum: 30 }
  validates :contest_type, length: { maximum: 30 }

  validates :name, presence: true
  validates :holding_times, presence: true
  validates :writer, presence: true
  validates :rating, presence: true
  validates :penalty, presence: true
  validates :start_time, presence: true
  validates :contest_type, presence: true
  validates :length, presence: true
end

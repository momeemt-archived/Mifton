class Contest < ApplicationRecord
  validates :name, length: { maximum: 30 }
  validates :problem_1_name, length: { maximum: 30 }
  validates :problem_2_name, length: { maximum: 30 }
  validates :problem_3_name, length: { maximum: 30 }
  validates :problem_4_name, length: { maximum: 30 }
  validates :writer, length: { maximum: 30 }
  validates :contest_type, length: { maximum: 30 }

  validates :name, presence: true
  validates :holding_times, presence: true
  # validates :problem_1_name, presence: true
  # validates :problem_2_name, presence: true
  # validates :problem_3_name, presence: true
  # validates :problem_4_name, presence: true
  # validates :problem_1, presence: true
  # validates :problem_2, presence: true
  # validates :problem_3, presence: true
  # validates :problem_4, presence: true
  # validates :problem_1_answer, presence: true
  # validates :problem_2_answer, presence: true
  # validates :problem_3_answer, presence: true
  # validates :problem_4_answer, presence: true
  # validates :submission_limit_1, presence: true
  # validates :submission_limit_2, presence: true
  # validates :submission_limit_3, presence: true
  # validates :submission_limit_4, presence: true
  # validates :executing_sample_1, presence: true
  # validates :executing_sample_2, presence: true
  # validates :executing_sample_3, presence: true
  # validates :executing_sample_4, presence: true
  # validates :execution_result_1, presence: true
  # validates :execution_result_2, presence: true
  # validates :execution_result_3, presence: true
  # validates :execution_result_4, presence: true
  # validates :executing_sample_1_remark, presence: true
  # validates :executing_sample_2_remark, presence: true
  # validates :executing_sample_3_remark, presence: true
  # validates :executing_sample_4_remark, presence: true
  validates :writer, presence: true
  validates :rating, presence: true
  validates :penalty, presence: true
  validates :start_time, presence: true
  validates :contest_type, presence: true
  validates :length, presence: true
end

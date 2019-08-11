class Topic < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, present: true
  validates :content, present: true
end

class ActivityLog < ApplicationRecord
  belongs_to :activity_type

  validates :activity_type_id, presence: true
  validates :date, presence: true
  validates :duration, presence: true
  validates :notes, presence: true
end
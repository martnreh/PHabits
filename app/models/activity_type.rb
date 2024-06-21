class ActivityType < ApplicationRecord
    has_many :activity_logs, dependent: :destroy
  
    validates :name, presence: true
  end
  
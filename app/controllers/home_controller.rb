class HomeController < ApplicationController
  def index
    @total_activities = ActivityLog.count
    @most_frequent_activity = ActivityType.joins(:activity_logs).group(:name).order('count_all DESC').count.first&.first
    @current_streak = calculate_current_streak
    @recent_activities = ActivityLog.includes(:activity_type).order(created_at: :desc).limit(5)
  end

  private

  def calculate_current_streak
    streak = 0
    current_date = Date.today

    while ActivityLog.where(date: current_date).exists?
      streak += 1
      current_date -= 1
    end

    streak
  end
end

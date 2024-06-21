class ActivityLogsController < ApplicationController
  def index
    @activity_logs = ActivityLog.includes(:activity_type).order(created_at: :desc)
  end

  def new
    @activity_log = ActivityLog.new
    @activity_types = ActivityType.all
  end

  def create
    @activity_log = ActivityLog.new(activity_log_params)
    if @activity_log.save
      redirect_to activity_logs_path, notice: 'Activity log was successfully created.'
    else
      @activity_types = ActivityType.all
      render :new
    end
  end

  def destroy
    @activity_log = ActivityLog.find(params[:id])
    @activity_log.destroy
    redirect_to activity_logs_path, notice: 'Activity log was successfully deleted.'
  end

  private

  def activity_log_params
    params.require(:activity_log).permit(:activity_type_id, :date, :duration, :notes)
  end
end

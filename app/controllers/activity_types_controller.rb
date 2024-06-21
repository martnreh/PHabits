class ActivityTypesController < ApplicationController
  def index
    @activity_types = ActivityType.all
  end

  def new
    @activity_type = ActivityType.new
  end

  def create
    @activity_type = ActivityType.new(activity_type_params)
    if @activity_type.save
      redirect_to activity_types_path, notice: 'Activity type was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @activity_type = ActivityType.find(params[:id])
    if @activity_type.destroy
      redirect_to activity_types_path, notice: 'Activity type was successfully deleted.'
    else
      redirect_to activity_types_path, alert: 'Activity type could not be deleted because it has associated activity logs.'
    end
  end

  private

  def activity_type_params
    params.require(:activity_type).permit(:name)
  end
end

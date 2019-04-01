class TimetablesController < ApplicationController
  def index; end

  def show
    group = StudentGroup.find_by(name: params[:group])
    if group.blank?
      flash[:error] = 'Группа не найдена'
      redirect_to root_path
      return
    end

    @records = group.timetable.timetable_records.preload(
        :subject, :lecturer, :room, :subject_time_period
    ).group_by(&:day_of_week)
  end
end

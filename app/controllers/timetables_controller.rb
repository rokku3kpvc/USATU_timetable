class TimetablesController < ApplicationController
  def index; end

  def show
    group = StudentGroup.find_by(name: params[:group])
    if group.blank?
      respond_to do |format|
        format.html do
          flash[:error] = 'Группа не найдена'
          redirect_to root_path
        end
      end
      return
    end
    @records = group.timetable.timetable_records.preload(
        :subject, :lecturer, :room, :subject_time_period
    ).group_by(&:day_of_week)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def filter_student_groups_by_course
    @groups = StudentGroup.where(student_course: StudentCourse.find_by(name: params[:selected_course]))
  end
end

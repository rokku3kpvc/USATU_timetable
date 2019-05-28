# TODO restructure DB and make 3 timetables for each group:
# semester, for_each_week & session.

class TimetablesController < ApplicationController
  def index; end

  def show
    group = StudentGroup.find_by(name: params[:group])
    # if group.blank?
    #   flash[:error] = 'Группа не найдена'
    #   redirect_to root_path
    #   return
    # end
    records_form(group)
    session[:search_params] = request.params
    respond_to do |format|
      format.html
      format.js
    end
  end

  def filter_student_groups_by_course
    @groups = StudentGroup.where(student_course: StudentCourse.find_by(
      name: params[:selected_course]
    ))
  end

  private

  def records_form(group)
    @records = group.timetable.timetable_records
    if params[:semester] != '1'
      @records = @records.joins(:weeks).where('weeks.id = ?', params[:week])
    end
    @records = @records.preload(
      :subject, :lecturer, :room, :subject_time_period
    ).group_by(&:day_of_week)
  end
end

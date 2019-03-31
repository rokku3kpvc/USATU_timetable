class TimetablesController < ApplicationController
  def index; end

  def show
    group = StudentGroup.find_by(name: params[:group])
    if group.blank?
      flash[:error] = 'Группа не найдена'
      redirect_to root_path
    end
    
    @timetable = @group
  end
end

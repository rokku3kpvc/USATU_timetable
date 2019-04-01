class TimetableRecord < ApplicationRecord
  belongs_to :timetable
  belongs_to :subject_time_period
  belongs_to :subject
  belongs_to :room
  belongs_to :lecturer
  belongs_to :week

  enum day_of_week: %i[Понедельник Вторник Среда Четверг Пятница Суббота]
end

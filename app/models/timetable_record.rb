class TimetableRecord < ApplicationRecord
  belongs_to :timetable
  belongs_to :subject_time_period
  belongs_to :subject
  belongs_to :room
  belongs_to :lecturer
  has_and_belongs_to_many :weeks

  validates :day_of_week, :weeks, presence: true

  enum day_of_week: %i[Понедельник Вторник Среда Четверг Пятница Суббота]
end

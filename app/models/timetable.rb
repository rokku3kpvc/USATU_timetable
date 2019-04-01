class Timetable < ApplicationRecord
  belongs_to :student_group
  has_many :timetable_records, dependent: :destroy
end

class TimetableRecord < ApplicationRecord
  belongs_to :subject_time_periods
  belongs_to :room
  belongs_to :lecturer
end

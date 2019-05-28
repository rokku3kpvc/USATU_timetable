class Week < ApplicationRecord
  has_and_belongs_to_many :timetable_records

  validates :w_num, presence: true
end

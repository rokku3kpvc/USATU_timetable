class StudentGroup < ApplicationRecord
  has_one :timetable
  belongs_to :student_course
  after_create :create_timetable_model

  validates :name, presence: true

  private

  def create_timetable_model
    self.create_timetable
  end
end

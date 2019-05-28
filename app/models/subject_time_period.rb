class SubjectTimePeriod < ApplicationRecord
  validates :name, :position, presence: true
end

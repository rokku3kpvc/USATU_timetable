class Lecturer < ApplicationRecord
  validates :name, presence: true
end

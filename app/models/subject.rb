class Subject < ApplicationRecord
  enum s_type: [
    'Лекция', 'Практика/Семинар', 'Лекция + Практика',
    'Лабораторная работа', 'Лекция + практика + лабораторная работа',
    'Консультация', 'Военная подготовка', 'Прочее'
  ]

  validates :name, presence: true
  validates :s_type, presence: true
end

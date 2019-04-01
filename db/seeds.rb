%w[6-306 7-105 6-201].each do |room|
  Room.create!(name: room)
end

%W[Первый Второй Третий Четвёртый Пятый Шестой].each do |course|
  StudentCourse.create!(name: course)
end

['8:00-9:35', '9:45-11:20', '12:10-13:45', '13:55-15:30', '16:10-17:45', '17:55-19:30', '20:05-21:40'].each_with_index do |time, i|
  SubjectTimePeriod.create!(name: time, position: i)
end

%w(АИС Программирование Мат.Логика).each do |name|
  Subject.create!(name: name)
end

%w[Иванцов Платонов Сидоров].each do |name| 
  Lecturer.create!(name: name)
end

User.create!(email: 'ykwnd@yahoo.com', password: 'test1234', role: 1)

# 6.times do |i|
#   StudentGroup.create!(name: "ИСТ-#{i}", student_course_id: i)
# end
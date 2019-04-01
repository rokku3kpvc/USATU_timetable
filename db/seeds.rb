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
  Subject.create!(name: name, s_type: 0)
end

%w[Иванцов Платонов Сидоров].each do |name|
  Lecturer.create!(name: name)
end

18.times do |i|
  Week.create!(w_num: i)
end

User.create!(email: 'ykwnd@yahoo.com', password: 'test1234', role: 1)

StudentGroup.create!(name: 'ИСТ-108', student_course: StudentCourse.find(1))
StudentGroup.create!(name: 'ИСТ-109', student_course: StudentCourse.find(1))
StudentGroup.create!(name: 'ИСТ-207', student_course: StudentCourse.find(2))
StudentGroup.create!(name: 'ИСТ-306', student_course: StudentCourse.find(3))
StudentGroup.create!(name: 'ИСТ-307', student_course: StudentCourse.find(3))
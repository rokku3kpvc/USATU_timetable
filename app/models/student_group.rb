class StudentGroup < ApplicationRecord
  has_one :timetable
  belongs_to :student_course
  after_create :create_timetable_model

  validates :name, presence: true, uniqueness: true

  def before_import_associations(record)
    import_group(record) if record[:timetable] && StudentGroup.find_by(name: record[:name]).nil?
    if (timetable_records = record[:timetable]['timetable_records'])
      timetable_records.each do |t_record|
        timetable = Timetable.find_by student_group: (StudentGroup.find_by name: record[:name])
        import_subj t_record
        import_room t_record
        import_lecturer t_record
        import_timetable_records t_record, timetable
      end
    end
  end

  def before_import_save(record)
    throw :skip
  end

  def after_import_association_error(record)
    throw :skip
  end

  private

  def find_subject(record)
    subj_name = record['subject']['name']
    subj_type = record['subject']['s_type']
    subj = Subject.find_by(name: subj_name, s_type: subj_type)

    yield subj_name, subj_type, subj if block_given?
    subj
  end

  def weeks_nums(record)
    weeks = record['weeks']
    weeks_arr = []
    weeks.each do |week|
      weeks_arr << Week.find_by(w_num: week['w_num'])
    end
    weeks_arr
  end

  def import_timetable_records(record, timetable)
    day_dict = { 'Понедельник' => 0, 'Вторник' => 1, 'Среда' => 2,
                 'Четверг' => 3, 'Пятница' => 4, 'Суббота' => 5 }
    day = day_dict[record['day_of_week']]
    subj_time_period = SubjectTimePeriod.find_by name: record['subject_time_period']['name']
    subj = find_subject(record)
    room = Room.find_by name: record['room']['name']
    lecturer = Lecturer.find_by name: record['lecturer']['name']
    weeks = weeks_nums record
    TimetableRecord.create(day_of_week: day, subject_time_period: subj_time_period,
                           timetable: timetable, subject: subj, room: room,
                           lecturer: lecturer, weeks: weeks)
  end

  def import_subj(record)
    find_subject(record) do |s_name, type, obj|
      Subject.create(name: s_name, s_type: type) unless obj
    end
  end

  def import_room(record)
    room_name = record['room']['name']
    Room.create name: room_name unless Room.find_by name: room_name
  end

  def import_lecturer(record)
    lecturer_name = record['lecturer']['name']
    Lecturer.create name: lecturer_name unless Lecturer.find_by name: lecturer_name
  end

  def import_group(record)
    group_name = record[:name]
    course_name = record[:student_course]['name']
    course = StudentCourse.find_by name: course_name
    StudentGroup.create(name: group_name, student_course: course)
  end

  def create_timetable_model
    self.create_timetable if !self.timetable
  end
end

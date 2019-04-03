class AddWeeksToTimetableRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :timetable_records, :weeks_duration, :string
  end
end

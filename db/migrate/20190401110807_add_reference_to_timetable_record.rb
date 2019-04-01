class AddReferenceToTimetableRecord < ActiveRecord::Migration[5.2]
  def change
    add_reference :timetable_records, :week, foreign_key: true, null: false, index: true
  end
end

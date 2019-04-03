class CreateWeeksTimetableRecordsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :weeks, :timetable_records do |t|
      t.index :week_id
      t.index :timetable_record_id
    end
  end
end

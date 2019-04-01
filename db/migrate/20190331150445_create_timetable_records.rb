class CreateTimetableRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :timetable_records do |t|
      t.integer :subgroup
      t.date :day_date
      t.integer :day_of_week
      t.references :subject_time_period, foreign_key: true, null: false, index: true
      t.references :timetable, foreign_key: true, null: false, index: true
      t.references :subject, foreign_key: true, null: false, index: true
      t.references :room, foreign_key: true, null: false, index: true
      t.references :lecturer, foreign_key: true, null: false, index: true

      t.timestamps
    end
  end
end

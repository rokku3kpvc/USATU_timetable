class CreateTimetables < ActiveRecord::Migration[5.2]
  def change
    create_table :timetables do |t|
      t.references :student_group, foreign_key: true, null: false

      t.timestamps
    end
  end
end

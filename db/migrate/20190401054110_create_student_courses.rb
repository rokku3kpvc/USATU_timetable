class CreateStudentCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :student_courses do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end

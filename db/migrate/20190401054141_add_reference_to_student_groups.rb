class AddReferenceToStudentGroups < ActiveRecord::Migration[5.2]
  def change
    add_reference :student_groups, :student_course, foreign_key: true, null: false, index: true
  end
end

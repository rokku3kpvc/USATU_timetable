class CreateStudentGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :student_groups do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end

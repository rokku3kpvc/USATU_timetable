class CreateSubjectTimePeriods < ActiveRecord::Migration[5.2]
  def change
    create_table :subject_time_periods do |t|
      t.string :name, null: false
      t.integer :position, null: false

      t.timestamps
    end
  end
end

class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.string :name, null: false
      t.integer :s_type, null: false

      t.timestamps
    end
  end
end

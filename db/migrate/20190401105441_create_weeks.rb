class CreateWeeks < ActiveRecord::Migration[5.2]
  def change
    create_table :weeks do |t|
      t.integer :w_num, null: false

      t.timestamps
    end
  end
end

class CreateReminders < ActiveRecord::Migration[5.2]
  def change
    create_table :reminders do |t|
      t.integer :day
      t.time :local_time
      t.string :time_zone
      t.integer :hour
      t.integer :minute

      t.timestamps
    end

    add_index :reminders, [:day, :hour, :minute]
  end
end

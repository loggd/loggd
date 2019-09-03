class AddJoinTableJournalReminders < ActiveRecord::Migration[5.2]
  def change
    create_join_table :journals, :reminders
  end
end

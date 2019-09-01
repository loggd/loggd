class AddPublicFieldToJournals < ActiveRecord::Migration[5.2]
  def change
    add_column :journals, :public, :boolean, default: false
  end
end

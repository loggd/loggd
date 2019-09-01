class AddPasswordToJournal < ActiveRecord::Migration[5.2]
  def change
    add_column :journals, :password_digest, :string
  end
end

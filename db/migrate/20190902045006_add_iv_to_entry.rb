class AddIvToEntry < ActiveRecord::Migration[5.2]
  def change
    add_column :entries, :iv, :string, unique: true, null: true
  end
end

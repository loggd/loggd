class ChangeBodyAndIvToBinaryOnEntry < ActiveRecord::Migration[5.2]
  def change
    remove_column :entries, :body
    remove_column :entries, :iv
    add_column :entries, :body, :binary
    add_column :entries, :iv, :binary
  end
end

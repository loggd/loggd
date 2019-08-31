class MakeUserHandleUniq < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :handle, unique: true
  end
end

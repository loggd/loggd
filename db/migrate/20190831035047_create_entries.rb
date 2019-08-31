class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.references :journal, foreign_key: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end

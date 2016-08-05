class CreateEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :entries do |t|
      t.string :author
      t.string :photo_url
      t.string :date_taken

      t.timestamps
    end
  end
end

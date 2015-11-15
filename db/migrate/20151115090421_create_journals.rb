class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.string :title
      t.text :entry
      t.references :box, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

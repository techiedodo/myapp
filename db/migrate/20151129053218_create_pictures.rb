class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.text :caption
      t.references :box, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateRecipients < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :name
      t.string :email
      t.date :DOB
      t.references :user, index: true, foreign_key: true
      t.references :box, index: true, foreign_key: true
      t.boolean :accepted

      t.timestamps null: false
    end
  end
end

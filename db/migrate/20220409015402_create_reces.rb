class CreateReces < ActiveRecord::Migration[6.1]
  def change
    create_table :reces do |t|
      t.integer :district_id
      t.string :name
      t.date :date
      t.integer :cost
      t.date :deadline
      t.text :link
      t.string :categorie
      t.string :venue
      t.text :introduction

      t.timestamps
    end
  end
end

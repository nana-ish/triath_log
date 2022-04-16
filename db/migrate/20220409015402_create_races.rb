class CreateRaces < ActiveRecord::Migration[6.1]
  def change
    create_table :races do |t|
      t.integer :district_id
      t.string :name
      t.date :date
      t.integer :cost
      t.date :deadline
      t.text :link
      t.string :categorie
      t.string :venue
      t.text :introduction
      t.boolean :is_active,default: true, null: true

      t.timestamps
    end
  end
end

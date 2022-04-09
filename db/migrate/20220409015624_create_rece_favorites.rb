class CreateReceFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :rece_favorites do |t|
      t.integer :district_id
      t.integer :end_user_id

      t.timestamps
    end
  end
end

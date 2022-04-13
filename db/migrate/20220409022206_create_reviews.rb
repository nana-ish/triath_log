class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :end_user_id
      t.integer :race_id
      t.float :score
      t.integer :revel
      t.integer :course
      t.integer :water
      t.integer :sightseeing
      t.string :title
      t.text :comment
      t.boolean :is_active

      t.timestamps
    end
  end
end

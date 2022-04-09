class CreateReviewFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :review_favorites do |t|
      t.integer :review_id
      t.integer :end_user_id

      t.timestamps
    end
  end
end

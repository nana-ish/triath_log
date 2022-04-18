class CreateReviewComments < ActiveRecord::Migration[6.1]
  def change
    create_table :review_comments do |t|
      t.integer :review_id
      t.integer :end_user_id
      t.text :text

      t.timestamps
    end
  end
end

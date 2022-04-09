class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :end_user_id
      t.integer :review_id
      t.text :text

      t.timestamps
    end
  end
end

class CreateReviews < ActiveRecord::Migration[7.2]
  def change
    create_table :reviews do |t|
      t.string :isbn, null: false
      t.integer :rating, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

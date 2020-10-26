class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :reviewer_name
      t.string :location
      t.string :store_name
      t.string :language
      t.date :reviewed_at
      t.string :status
      t.string :link
      t.float :rating
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end

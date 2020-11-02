class AddReferencesToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :user, null: true, foreign_key: true
    add_reference :reviews, :application, null: false, foreign_key: true
  end
end

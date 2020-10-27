class AddDefaultPendingToStatusForReviews < ActiveRecord::Migration[6.0]
  def change
    change_column_default :reviews, :status, from: nil, to: "pending" 
  end
end

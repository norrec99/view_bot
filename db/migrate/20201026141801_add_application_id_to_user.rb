class AddApplicationIdToUser < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :application, null: true, foreign_key: true
  end
end

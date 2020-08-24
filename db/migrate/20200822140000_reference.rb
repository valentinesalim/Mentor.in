class Reference < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :appointments, :events
    add_foreign_key :appointments, :users, column: requester_id
    add_foreign_key :events, :users
    add_foreign_key :reviews, :appointments
  end
end

class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :status
      t.datetime :date
      t.references :event, null: false, foreign_key: true
      t.references :requester, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end

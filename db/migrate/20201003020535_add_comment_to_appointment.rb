class AddCommentToAppointment < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :comment, :string
  end
end

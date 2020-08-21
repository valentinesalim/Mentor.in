class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :fullname, :string
    add_column :users, :title, :string
    add_column :users, :expertise, :string
    add_column :users, :about, :text
    add_column :users, :content, :text
  end
end

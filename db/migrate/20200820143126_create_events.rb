class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :difficulty
      t.string :link
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

class CreateStories < ActiveRecord::Migration[6.0]
  def change
    create_table :stories do |t|
      t.string :title, null: false
      t.string :outline, null: false
      t.string :genre, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateChapters < ActiveRecord::Migration[6.0]
  def change
    create_table :chapters do |t|
      t.string :chapter_title, null: false
      t.text :content, null: false
      t.string :writing, null: false
      t.references :story, null: false, foreign_key: true

      t.timestamps
    end
  end
end

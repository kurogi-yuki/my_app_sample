class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :character_name, null: false
      t.integer :age, null: false
      t.string :gender, null: false
      t.references :story, null: false, foreign_key: true

      t.timestamps
    end
  end
end

class CreateDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :decks do |t|
      t.string :name, null: false
      t.string :objective, null: true
      t.integer :course_id, null: false
    end

    add_index :decks, %i(course_id name), unique: true
  end
end

class CreateIdeaBoards < ActiveRecord::Migration[5.2]
  def change
    create_table :idea_boards do |t|
      t.integer :user_id
      t.integer :tag_id
      t.integer :genre_id
      t.string :head
      t.text :body

      t.timestamps
    end
  end
end

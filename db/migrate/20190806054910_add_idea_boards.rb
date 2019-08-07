class AddIdeaBoards < ActiveRecord::Migration[5.2]
  def change
  	add_column :idea_boards, :image_id, :string
  end
end

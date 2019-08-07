class Add < ActiveRecord::Migration[5.2]
  def change
  	add_column :idea_boards, :likes_count, :integer
  end
end

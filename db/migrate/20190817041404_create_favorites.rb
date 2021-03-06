class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
      t.references :user, foreign_key: true
      t.references :idea_board, foreign_key: true

      t.timestamps
      t.index [:user_id, :idea_board_id], unique: true
    end
  end
end

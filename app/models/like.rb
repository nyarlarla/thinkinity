class Like < ApplicationRecord
	belongs_to :idea_board, counter_cache: :likes_count
	belongs_to :user
end

class Comment < ApplicationRecord
	validates :text, presence: true

	belongs_to :user
	belongs_to :idea_board
end

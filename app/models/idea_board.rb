class IdeaBoard < ApplicationRecord
	validates :head, presence: true
	validates :body, presence: true

	belongs_to :user
	belongs_to :genre

	has_many :comments, dependent: :destroy
	has_many :favorites, foreign_key: 'idea_board_id', dependent: :destroy
	has_many :users, through: :favorites

	acts_as_taggable
	attachment :image
end

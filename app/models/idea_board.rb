class IdeaBoard < ApplicationRecord
	belongs_to :user
	belongs_to :genre
	has_many :comments, dependent: :destroy
	acts_as_taggable
	attachment :image
end

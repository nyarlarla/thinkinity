class IdeaBoard < ApplicationRecord
	belongs_to :user
	belongs_to :genre
	has_many :likes, dependent: :destroy
	has_many :comments, dependent: :destroy
	acts_as_taggable
	attachment :image
	def like_user(user_id)
		likes.find_by(user_id: user_id)
	end
end

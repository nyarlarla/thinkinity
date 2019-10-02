class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_many :idea_boards, dependent: :destroy
	has_many :comments, dependent: :destroy

	attachment :image

	has_many :favorites, dependent: :destroy
  	has_many :favposts, through: :favorites, source: :idea_board

  	has_many :messages, dependent: :destroy
  	has_many :entries, dependent: :destroy

  	def like(idea_board)
    favorites.find_or_create_by(idea_board_id: idea_board.id)
  	end


	def unlike(idea_board)
	favorite = favorites.find_by(idea_board_id: idea_board.id)
	favorite.destroy if favorite
	end


	def  favpost?(idea_board)
	self.favposts.include?(idea_board)
	end

end

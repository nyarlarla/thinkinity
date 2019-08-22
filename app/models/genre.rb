class Genre < ApplicationRecord
	validates :genre_symbol, presence: true
	has_many :idea_boards, dependent: :destroy
end

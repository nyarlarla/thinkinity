class Genre < ApplicationRecord
	has_many :idea_boards, dependent: :destroy
end

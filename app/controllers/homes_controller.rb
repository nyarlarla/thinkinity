class HomesController < ApplicationController

	def top
		@idea_board = IdeaBoard.new
		@genres = Genre.all
	end


	def about
		@idea_board = IdeaBoard.new
		@genres = Genre.all
	end
end

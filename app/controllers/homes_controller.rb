class HomesController < ApplicationController

	def top
		@idea_board = IdeaBoard.new
	end


	def about
		@idea_board = IdeaBoard.new
	end
end

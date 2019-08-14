class GenresController < ApplicationController

	def index
		@genres = Genre.all
		@idea_board = IdeaBoard.new
	end

	def show
		@idea_board = IdeaBoard.new
		@genres = Genre.all
		@genre = Genre.find(params[:id])
		@idea_boards = @genre.idea_boards.page(params[:page]).per(20).order(created_at: :desc)
	end
end
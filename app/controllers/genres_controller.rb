class GenresController < ApplicationController

	def index
		@genres = Genre.all
	end

	def show
		@genres = Genre.all
		@genre = Genre.find(params[:id])
		@idea_boards = @genre.idea_boards.page(params[:page]).per(20).order(created_at: :desc)
	end
end
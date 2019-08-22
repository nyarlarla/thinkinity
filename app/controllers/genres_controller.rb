class GenresController < ApplicationController
	before_action :login_check, only: [:show, :index]

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

	private
 	def login_check
      unless user_signed_in?
        flash[:alert] = "ログインしてください"
        redirect_to root_path
      end
    end
end
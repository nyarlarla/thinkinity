class IdeaBoardsController < ApplicationController

	def new
		@idea_board = IdeaBoard.new
	end

	def create
		@idea_board = IdeaBoard.new(idea_board_params)
		@idea_board.save
	end

	def index
		@idea_board = IdeaBoard.new
		@idea_boards = IdeaBoard.all
	end

	def show
		@idea_board = IdeaBoard.find(params[:id])
	end

	def edit
		@idea_board = IdeaBoard.find(params[:id])
	end

	def update
		@idea_board = IdeaBoard.find(params[:id])
		@idea_board.update()
	end

	def destroy
		@idea_board = IdeaBoard.find(params[:id])
		@idea_board.destroy(idea_board_params)
	end

	private
	def idea_board_params
		params.require(:idea_board).permit(:user_id, :tag_id, :genre_id, :head, :body)
	end
end

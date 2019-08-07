class IdeaBoardsController < ApplicationController

	def new
		@idea_board = IdeaBoard.new
	end

	def create
		@idea_board = IdeaBoard.new(idea_board_params)
		if@idea_board.save
			redirect_to genres_path
		else
    		redirect_to genres_path
    	end
	end

	def index
		@idea_board = IdeaBoard.new
		@idea_boards = IdeaBoard.all.order(created_at: :desc)
	end

	def show
		@idea_board = IdeaBoard.find(params[:id])
		@comments = @idea_board.comments
		@comment = Comment.new
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
		params.require(:idea_board).permit(:user_id, :tag_id, :genre_id, :head, :body, :tag_list)
	end
end

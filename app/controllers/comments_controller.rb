class CommentsController < ApplicationController
	def create
		@idea_board = IdeaBoard.find(params[:idea_board_id])
		@comment = @idea_board.comments.build(comment_params)
		@comment.user = current_user
		if @comment.save
	       redirect_to idea_board_path(@idea_board)
	    else
	       redirect_to(idea_boards_path)
	       flash[:notice] = "コメントの投稿に失敗しました"
	    end
	end

	private
		def comment_params
			params.require(:comment).permit(:text)
		end
end

class CommentsController < ApplicationController
	def create
		@comment = Comment.new(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
	      redirect_back(fallback_location: root_path)
	    else
	      redirect_back(fallback_location: root_path)
	    end

  end
	end

	private
		def comment_params
			params.require(:comment).permit(:user_id, :idea_board_id, :text)
		end
	end
end

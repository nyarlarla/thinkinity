class IdeaBoardsController < ApplicationController
before_action :login_check, only: [:show, :index, :new, :edit, :update, :destroy]
before_action :correct_user, only: [:edit, :update]

	def new
		@idea_board = IdeaBoard.new
	end

	def create
		@idea_board = IdeaBoard.new(idea_board_params)
		@idea_board.user_id = current_user.id
		if@idea_board.save
			redirect_back(fallback_location: root_path)
			flash[:success]
		else
    		redirect_back(fallback_location: root_path)
    		flash[:notice]
    	end
	end

	def index
		@genres = Genre.all
		@idea_board = IdeaBoard.new
		if params[:tag]
			@idea_boards = IdeaBoard.tagged_with(params[:tag]).page(params[:page]).per(20).order(created_at: :desc)
  		else
			@idea_boards = @search_idea_boards.page(params[:page]).per(20).order(created_at: :desc)
		end
	end

	def show
		@genres = Genre.all
		@idea_board = IdeaBoard.find(params[:id])
		@comments = @idea_board.comments
		@comment = Comment.new
	end

	def edit
		@idea_board = IdeaBoard.new
		@genres = Genre.all
		@idea_board = IdeaBoard.find(params[:id])
	end

	def update
		@idea_board = IdeaBoard.find(params[:id])
		if @idea_board.update(idea_board_params)
	        redirect_to user_path(@idea_board.user)
		else
	        render :edit
		end
	end

	def destroy
		@idea_board = IdeaBoard.find(params[:id])
		if @idea_board.destroy(idea_board_params)
			redirect_to user_path(current_user.id)
		else
    		redirect_to user_path(current_user.id)
    	end
	end

	private
	def idea_board_params
		params.require(:idea_board).permit(:user_id, :tag_id, :genre_id, :head, :body, :tag_list, :image)
	end

	def correct_user
      @user = current_user
      unless @user
        redirect_to root_url
      end
    end

	def login_check
      unless user_signed_in?
        flash[:alert] = "ログインしてください"
        redirect_to root_path
      end
    end
end

class FavoritesController < ApplicationController
  def index
    @idea_board = IdeaBoard.new
    @genres = Genre.all
    @user = current_user
    @favorites = Favorite.where(user_id: @user.id).all
  end

	def create
    idea_board = IdeaBoard.find(params[:idea_board_id])
    current_user.like(idea_board)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    idea_board = IdeaBoard.find(params[:idea_board_id])
    current_user.unlike(idea_board)
    redirect_back(fallback_location: root_path)
  end
end

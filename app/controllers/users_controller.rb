class UsersController < ApplicationController

def show
      @genres = Genre.all
  	  @user = User.find(params[:id])
      @idea_boards = @user.idea_boards.page(params[:page]).per(20).order(created_at: :desc)
      @idea_board = IdeaBoard.new
  end

  def edit
  	  @user = User.find(params[:id])
      if @user.id != current_user.id
      redirect_to root_path
      end
  end

  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to user_path
      else
        render :edit
      end
  end

  def destroy
      @user = User.find(params[:id])
      if user.destroy
        redirect_to root_path
      end
  end

	private
    def user_params
    	params.require(:user).permit( :name, :image_id, :profile, :email)
    end
end

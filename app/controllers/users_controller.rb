class UsersController < ApplicationController
  before_action :login_check, only: [:show, :index, :new, :edit, :update, :destroy]
  before_action :authenticate_user!, :only => [:show]
  before_action :correct_user, only: [:edit, :update]

  def show
      @idea_board = IdeaBoard.new
      @genres = Genre.all
  	  @user = User.find(params[:id])
      @currentUserEntry=Entry.where(user_id: current_user.id)
      @userEntry=Entry.where(user_id: @user.id)
      if @user.id == current_user.id
      else
        @currentUserEntry.each do |cu|
          @userEntry.each do |u|
            if cu.room_id == u.room_id then
              @isRoom = true
              @roomId = cu.room_id
            end
          end
        end
        if @isRoom
        else
          @room = Room.new
          @entry = Entry.new
        end
      end
      @idea_boards = @user.idea_boards.page(params[:page]).per(20).order(created_at: :desc)
  end

  def edit
      @genres = Genre.all
      @idea_board = IdeaBoard.new
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
      if @user.destroy
        redirect_to root_path
      end
  end

  def likes
    @user = User.find(params[:id])
    @favposts = @user.favposts.page(params[:page])
    counts(@user)
  end

	private
    def user_params
    	params.require(:user).permit( :name, :image, :profile, :email)
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

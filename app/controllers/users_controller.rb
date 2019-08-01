class UsersController < ApplicationController

	def new
	end

	def create
	end

	def index
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private
    def user_params
    	params.require(:user).permit( :name, :image_id, :profile, :email)
    end
end

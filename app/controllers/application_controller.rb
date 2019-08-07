class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :set_search
	def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  	end

	def set_search
	  @search = IdeaBoard.ransack(params[:q])
	  @search_idea_boards = @search.result.page(params[:page])
	end
end

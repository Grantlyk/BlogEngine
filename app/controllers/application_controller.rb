class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :current_user
  protect_from_forgery with: :exception

	def admin_required
     unless current_user && current_user.is_admin?
       flash[:error] = "Sorry, you don't have access to that."
       redirect_to root_url and return false
     end
   	end


  private
  	def current_user
  		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
end

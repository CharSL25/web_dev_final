module Authentication
    extend ActiveSupport::Concern
  
    included do
      helper_method :current_user
    end
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  
    def authenticate_user!
      redirect_to login_path, alert: "You need to login first" unless current_user
    end
  end
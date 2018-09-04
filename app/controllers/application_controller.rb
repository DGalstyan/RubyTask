class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do
    redirect_to root_url # if user is not have access redirect to root page
  end

  def after_sign_in_path_for(_resource)
    return admin_users_path if current_user.admin? # after sign in redirect admin page if user is admin
    session[:previous_url] || root_url # redirect root path
  end

  def handle_unverified_request
    redirect_to root_url # handle unverified request and redirect to root url
  end
end

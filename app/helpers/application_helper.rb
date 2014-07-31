module ApplicationHelper

  def notice
    flash[:notice] if flash[:notice]
  end

  def alert
    flash[:alert] if flash[:alert]
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def show_login_or_logout
    render template: user_signed_in? ? "/users/sessions/logout" : "/users/sessions/new"
  end

end

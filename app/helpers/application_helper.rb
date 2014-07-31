module ApplicationHelper

  def notice
    flash[:notice] if flash[:notice]
  end

  def alert
    flash[:alert] if flash[:alert]
  end
end

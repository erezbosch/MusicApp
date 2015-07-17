module UsersHelper
  def user_admin_tools(user)
    return nil unless current_user.admin
    html = link_to "toggle admin", toggle_admin_user_url(user)
    html += " "
    html += link_to "delete", user_url(user), method: :delete
    html.html_safe
  end
end

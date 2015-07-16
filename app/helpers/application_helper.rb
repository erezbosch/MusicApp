module ApplicationHelper
  include ERB::Util

  def auth_token
    html  = <<-HTML
      <input type='hidden'
             name='authenticity_token'
             value=#{form_authenticity_token}
             >
    HTML

    html.html_safe
  end

  def session_interaction_options
    if current_user
      html = "welcome, #{h(current_user.email)}! "
      html += link_to "sign out", session_url, method: :delete
    else
      html = <<-HTML
        <a href='#{new_user_url}'>sign up</a>
        <a href='#{new_session_url}'>sign in</a>
      HTML
    end
    html.html_safe
  end

  def show_errors
    if flash[:errors]
      html = "<ul>"
      flash[:errors].each { |error| html += "<li>#{h(error)}</li>" }
      (html + "</ul>").html_safe
    else
      ""
    end
  end
end

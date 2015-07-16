module ApplicationHelper
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
      link_to "Sign out", session_url, method: :delete
    else
      html = <<-HTML
        <a href='#{new_user_url}'>Sign up</a>
        <a href='#{new_session_url}'>Sign in</a>
      HTML

      html.html_safe
    end
  end
end

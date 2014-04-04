module ApplicationHelper
  def current_action?(controller_name, action_name)
    return params[:controller] == controller_name && params[:action] == action_name
  end
end

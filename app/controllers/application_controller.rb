class ApplicationController < ActionController::Base

  helper_method :request_count


  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # request_count is the notification for friendship requests you received
  # it is stored in application_controller in order to be available in ALL VIEWS of the applicaiton, not only in the users view, if we had defined it in the users_controller
  # now it will be availabe to be displayed in the top bar
  def request_count
    if current_user
      current_user.pending_friend_requests_from.map(&:user).size
    end
  end

end

module UsersHelper

  def action_button (user)
    # friendship_status Method defined in User Model
    # checking friendship status between current_user and each user passed in the views/users/_user.html.slim partial
    case current_user.friendship_status(user)
    when "friends"
      "Remove Friendhip"
    when "pending"
      "Cancel Request"
    when "requested"
      "Accept or Deny"
    when "not_friends"
      "Add friend"
    end
  end
  
end

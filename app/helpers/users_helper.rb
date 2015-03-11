module UsersHelper

  def action_button (user)
    # friendship_status Method defined in User Model
    # checking friendship status between current_user and each user passed in the views/users/_user.html.slim partial
    case current_user.friendship_status(user)
    when "friends"
      # find the friendship of current_user with the user, using friendship_finder Method defined in user.rb Model
      link_to "Cancel Friendship", friendship_path(current_user.friendship_finder(user)), method: :delete
    when "pending"
      link_to "Cancel Request", friendship_path(current_user.friendship_finder(user)), method: :delete
    when "requested"
      # this is an update, will have the method :put
      link_to "Accept", accept_friendship_path(current_user.friendship_finder(user)), method: :put
    when "not_friends"
      # pass the user.id, needed for the create Method in friendship_controller
      # the create action is coming from a link_to, not from a form, so we need to specify method: :post
      link_to "Add Friend", friendships_path(user_id: user.id), method: :post
    end
  end

end

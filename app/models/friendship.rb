class Friendship < ActiveRecord::Base
#will be tracked by public_activity gem
include PublicActivity::Model

  belongs_to :user    #the user is the one requesting the friendship

  belongs_to :friend, class_name: "User"  #the friend is the one that receives the request for friendship.
  # he is still a User, but cannot belong again to User.
  # this is why a PSEUDOCLASS ":friend" is used.
  # this will CORELATE the friend_id in Friendship with an actual User

  #handling friendship requests
  def accept_friendship
  	# "self" is used for the current friendship
  	self.update_attributes(state: "active", friended_at: Time.now)
  end

  def deny_friendship
  	self.destroy
  end

  def cancel_friendship
  	self.destroy
  end


end

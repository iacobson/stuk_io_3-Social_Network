class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ### CHANGED validate the presence and uniqueness of username
  validates :username, presence: true, uniqueness: true
    # that can be done the other way around (if you have more elements):
    # validates_presence_of :username, :etc, :etc
    # validates_uniqueness_of :username, :etc, :etc


  # linking with friendship model
  has_many :friendships, dependent: :destroy # if you delete a user, the corresponding friendships will be deleted

  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id", dependent: :destroy
  # this user will be the friend_id in the Friendships model, so we can find users that are his friends.
  # this is why the foreign_key needs to be specified


  # requesting friendship ==> will be used in friendships_controller method Create
  # consider user_1 as the user that request the friendship
  # and user 2 as the one that must accept
  # usage: current_user.request_friendship(user_2)
  def request_friendship (user_2)
    #self will be current user (user_1)
    self.friendships.create(friend: user_2)
  end

  # friend types

  # active friends
  def active_friends
	# friends I requested + friends that requested my friendship
  # map to get the exact list of friends
	 self.friendships.where(state: "active").map(&:friend) + self.inverse_friendships.where(state: "active").map(&:user)
  end

  # friend requests I received and not yet approved (or rejected)
  def pending_friend_requests_from
    self.inverse_friendships.where(state: "pending")
  end

  # friend requests I sent but dit not get any response yet
  def pending_friend_requests_to
    self.friendships.where(state: "pending")
  end

  # checking friendship status between current user and other user
  def friendship_status (user_2)
    # friendship is selecting records where the user_id AND friend_id is the current user OR the user we want to check friendship against
    # friendship is checking relation between 2 persons, so will always have only ONE record
    friendship = Friendship.where(user_id: [self.id, user_2.id], friend_id: [self.id, user_2.id])
    # if no record in friendship users are not friends
    unless friendship.any?
      return "not_friends"
    else
      if friendship.first.state == "active"
        return "friends"
      else
        # if current user is the friendship user, he requested friendship but not received yet the response
        if friendship.first.user == self
          return "pending"
        # if current user is the friendship friend, he received a friend request but did not responded
        elsif friendship.first.friend == self
          return "requested"
        end
      end
    end
  end

  #find the friendship between 2 users, needed for destroy method in friendship.controller
  #will be passed on by the link in users_helper
  def friendship_finder(user_2)
    Friendship.where(user_id: [self.id, user_2.id], friend_id: [self.id, user_2.id]).first
  end


end

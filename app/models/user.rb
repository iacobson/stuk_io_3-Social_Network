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


  # requesting friendship
  # consider user_1 as the user that request the friendship
  # and user 2 as the one that must accept
  def request_friendship (user_2)
    #self will be current user (user_1)
    self.friendships.create(friend: user_2)
  end

end

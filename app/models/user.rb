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

end

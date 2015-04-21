class Post < ActiveRecord::Base
#will be tracked by public_activity gem
include PublicActivity::Model

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  #user must be logged to post
  validates_presence_of :user_id
  validates_presence_of :content

  #auto_html gem configuration
  #specify where the content is coming from (:content)
  auto_html_for :content do
    html_escape
    image
    youtube(width: "100%", height: 400, autoplay: false)
    link target: "_blank", rel: "nofollow"
    simple_format
  end

  def count_comments
    self.comments.count
  end

  def count_likes
    self.likes.count
  end

  #finding the corresponding like for each post.
  def find_post_like(user)
    current_post_id = self.id
    current_like = Like.where{(post_id == current_post_id) & (user_id == user.id)}
    if current_like.count > 0
      return current_like.first.id
    else
      return false
    end
  end

  def user_liked_post?(user1)
    # if you put "self" inside the "where" expression, will get the Like, not the Post, this is why current_post_id is defined
    if find_post_like(user1) != false
      return true
    else
      return false
    end
  end


end

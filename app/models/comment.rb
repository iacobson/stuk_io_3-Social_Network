class Comment < ActiveRecord::Base
#will be tracked by public_activity gem
include PublicActivity::Model

  belongs_to :user
  belongs_to :post
  has_many :likes, dependent: :destroy

  #user must be logged to post
  validates_presence_of :user_id
  validates_presence_of :post_id
  validates_presence_of :comment_content

  #auto_html gem configuration
  #specify where the content is coming from (:comment_content)
  auto_html_for :comment_content do
    html_escape
    image
    youtube(width: "100%", height: 400, autoplay: false)
    link target: "_blank", rel: "nofollow"
    simple_format
  end

end

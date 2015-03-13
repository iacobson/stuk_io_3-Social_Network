class Post < ActiveRecord::Base
#will be tracked by public_activity gem
include PublicActivity::Model

  belongs_to :user

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

end

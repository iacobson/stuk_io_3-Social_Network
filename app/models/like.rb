class Like < ActiveRecord::Base
  include PublicActivity::Model

  belongs_to :user
  belongs_to :post
  belongs_to :comment

  validates_presence_of :user_id

end

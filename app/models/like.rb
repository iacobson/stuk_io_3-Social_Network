class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  belongs_to :comment

  validates_presence_of :user_id

end

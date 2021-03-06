class ActivitiesController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  # display our friends plus our activites in views/activites/index.html.slim
  def index
    # fetch all active friends. active_friends Method is defined in users Model
    @users = current_user.active_friends
    # add our own user to display activities on the timeline
    @users.push(current_user)

    # define the cases for all/post buttons in views/activites/index.html.slim
    # pass or not pass params[:content]
    case params[:content]
    when 'posts'
      # when the link contains params "post", display only the posts, by specifying the trackable_type
      @activities = PublicActivity::Activity.where(owner_id: @users, trackable_type: "Post").order{updated_at.desc}
    else
      # ******
      # sort Public Activity by the "updated_at" of the corresponding models (trackable)
      @activities = PublicActivity::Activity.where(owner_id: @users, trackable_type: ["Post", "Friendship"]).sort_by {|e| e.trackable.updated_at}.reverse!
    end

    # creating new posts in activities/inxed
    @post = Post.new

    # creating new comments in activities/inxed
    @comment = Comment.new


  end

end

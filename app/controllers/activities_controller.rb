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
      @activities = PublicActivity::Activity.where(owner_id: @users).order{updated_at.desc}
    end

    # creating new posts in activities/inxed
    @post = Post.new
    

  end

end

$("#post_nr_#{<%= @post.id %>} .likes").html("<%= j render 'likes/like' %>")

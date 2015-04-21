$("#post_nr_#{<%= @post.id %>} .show_like").remove()
$("#post_nr_#{<%= @post.id %>} .likes").append("<%= j render 'likes/like' %>")

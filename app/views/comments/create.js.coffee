$("#post_nr_<%= @post.id %> .post_comments").prepend("
    <small>
      <%= j link_to @comment.user.username, user_path(@comment.user) %>'s comment:
    </small>
    <div class='comment'>
      <%= j raw(@comment.comment_content_html) %>
    </div>
")

$('.input_comment_content').val('')

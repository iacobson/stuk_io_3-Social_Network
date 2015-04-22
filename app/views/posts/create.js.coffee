# if the post is created from the timeline
if $('.activities.index').length > 0
  $('ul.timeline li').first().after('
    <li>
      <%= j render "activities/activity_post", activity: @activity %>
    </li>
  ')


# if post is created from show page
else if $('.users.show').length > 0
  $('.posts_list').prepend(' <%= j render @post %>')

$('.input_post_content').val('')

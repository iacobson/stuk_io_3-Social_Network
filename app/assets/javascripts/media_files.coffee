
# default jquery "$(document).ready ->" will not work becuse of Turbolinks

$(document).on 'page:change', ->
  # all images inside #media_content will have img-responsive, needed for auto_html gem, to resize pictures
  $("#media_content img").addClass("img-responsive")

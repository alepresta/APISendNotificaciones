Given (/^a precondition step$/) do
  # The code that perform this step action
  line


  base_url          =  "http://181.209.76.233/api"
  bodyUsername      =  "apresta"
  bodyPassword      =  "IBl@pyWolZ835nav"
  headerContentType =  "application/x-www-form-urlencoded"



  base_api = BaseControllerNotificacionesQA.new
  token = base_api.getToken(bodyUsername,bodyPassword, headerContentType)
  # user   =  base_api.getUser(token, headerContentType)
  # status = base_api.getStatus(bodyUsername,bodyPassword, headerContentType)
  notification = base_api.getNotification(token, headerContentType )

  line
  puts "GET TOKEN::".red
  line
  puts token
  line

  line
  puts "STATUS::".red
  line
  #puts status
  line

  line
  puts "GET Notification::".red
  line
 # puts JSON.pretty_generate(user)

  line



end


When (/^a step that makes the main change$/) do
  # The code that perform this step action
end

Then (/^a step that assert the expected result$/) do
  # The code that perform this step action
end

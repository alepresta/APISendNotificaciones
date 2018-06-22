Given (/^a precondition step$/) do
  # The code that perform this step action
  line


  base_url          =  "http://181.209.76.233/api"
  bodyUsername      =  "DJirzJmecX4rhBQa38DgG2HHtnHxfPxQ"
  bodyPassword      =  "5jUcfWGpTi8M5MzYNW2sp9WNC8FuiUiv"
  headerContentType =  "application/x-www-form-urlencoded"



  base_api = BaseControllerNotificacionesQA.new
  token = base_api.getToken(bodyUsername,bodyPassword, headerContentType)
  user   =  base_api.getUser(token, headerContentType)
  status = base_api.getStatus(bodyUsername,bodyPassword, headerContentType)


  line
  puts "GETOKEN::".red
  line
  puts token
  line

  line
  puts "STATUS::".red
  line
  puts status
  line

  line
  puts "GETUSER::".red
  line
  puts JSON.pretty_generate(user)

  line



end


When (/^a step that makes the main change$/) do
  # The code that perform this step action
end

Then (/^a step that assert the expected result$/) do
  # The code that perform this step action
end

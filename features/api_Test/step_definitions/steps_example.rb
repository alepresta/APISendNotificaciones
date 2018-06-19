Given (/^a precondition step$/) do
  # The code that perform this step action
  line





  BaseController = BaseController.new
  response = BaseController.getToken
  line
  puts "GETOKEN::".red
  puts response
  line


  puts "GETUSER::".red
  response2 = BaseController.getUser
  line
  puts response2
  line



















































end


When (/^a step that makes the main change$/) do
  # The code that perform this step action
end

Then (/^a step that assert the expected result$/) do
  # The code that perform this step action
end

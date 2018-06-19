Given (/^a precondition step$/) do
  # The code that perform this step action
  line


  class ClassAPI
    include HTTParty
    base_uri "http://181.209.76.233/api"


    def getToken
      bodyUsername = "DJirzJmecX4rhBQa38DgG2HHtnHxfPxQ"
      bodyPassword = "5jUcfWGpTi8M5MzYNW2sp9WNC8FuiUiv"
      headerContentType = "application/x-www-form-urlencoded"
      self.class.post('/auth/login',
                      :body => {:username => bodyUsername,
                                :password => bodyPassword,
                      },
                      :headers => {'Content-Type' => headerContentType}
      )
    end








  $token_type = "Bearer"
  $token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiYWRtaW4iLCJzdXJuYW1lIjoiYWRtaW4iLCJ1c2VybmFtZSI6IkRKaXJ6Sm1lY1g0cmhCUWEzOERnRzJISHRuSHhmUHhRIiwiZW1haWwiOiJtY3Jlc3BpQGdtYWlsLmNvbSIsInVyaSI6IjU5NjY2MDkzODg0ZGMzMjZjN2EzMGRiMyIsImlhdCI6MTUyOTQxNTcyOCwiZXhwIjoxNTI5NDE5MzI4fQ.OxRpOYooLK-ZqzMb2c7sUXD1D0r3SSh_L848i3pHa4E"
  expires_in = "3600"



    def getUser
      headerContentType = "application/x-www-form-urlencoded"
      self.class.get('/v1.0',
                      :headers => {
                          'Authorization' => "#{$token_type} #{$token}",
                          'Content-Type' => headerContentType
                      }
      )
    end
  end


  ClassAPI = ClassAPI.new
  response = ClassAPI.getToken
  line
  puts "GETOKEN::".red
  puts response
  line


  puts "GETUSER::".red
  response2 = ClassAPI.getUser
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

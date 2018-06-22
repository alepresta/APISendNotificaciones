require "json"

class BaseControllerNotificacionesQA

  include HTTParty

  base_uri "http://181.209.76.233/api"


  def getToken(bodyUsername, bodyPassword, headerContentType )
    r = self.class.post('/auth/login',
                        :body => {:username => bodyUsername,
                                  :password => bodyPassword,
                        },
                        :headers => {'Content-Type' => headerContentType}
    )
    body = JSON.parse(r.body)

    #headers = r.headers  # trae los datos del headers
    # expires_in = body['expires_in'] # Muestra el tiempo de expiración de sesión

    status = r.code
    if status  === 200
      token = body['token']
      token_type = body['token_type']
      result = token_type + " " + token
=begin
    else
      result =  "ERROR Status: #{r.code}"

=end
    end
    return result
  end

  def getUser(token, headerContentType )
    self.class.get('/v1.0',
                   :headers => {
                       'Authorization' => token,
                       'Content-Type' => headerContentType
                   }
    )
  end

  def getStatus(bodyUsername, bodyPassword, headerContentType)
    r = self.class.post('/auth/login',
                        :body => {:username => bodyUsername,
                                  :password => bodyPassword,
                        },
                        :headers => {'Content-Type' => headerContentType}
    )
    return r.code
  end





end
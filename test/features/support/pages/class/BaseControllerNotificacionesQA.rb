  require "json"

  class BaseControllerNotificacionesQA

    include HTTParty

    base_uri "https://notificaciones-qa.argentina.gob.ar/1.0"

    def getToken(bodyUsername, bodyPassword, headerContentType )
      r = self.class.post('/api-auth/token',
      :body    => {:username => bodyUsername,
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
        #token_type = body['token_type']
        # result = token_type + " " + token
        result = "Token " + token
        else
        result =  "ERROR Status: #{r.code}"
      end


      return result
    end


    def getNotification(token, headerContentType )

      self.class.get('/notifications',
                     :headers => {
                         'Authorization' => token,
                         'Content-Type' => headerContentType
                     }
      )

    end






=begin
    def getUser(token, headerContentType )
    self.class.get('/v1.0',
    :headers => {
    'Authorization' => token,
    'Content-Type' => headerContentType
    }
    )
    end
=end

=begin
    def getStatus(bodyUsername, bodyPassword, headerContentType)
    r = self.class.post('/auth/login',
    :body => {:username => bodyUsername,
    :password => bodyPassword,
    },
    :headers => {'Content-Type' => headerContentType}
    )
    return r.code
    end
=end





  end
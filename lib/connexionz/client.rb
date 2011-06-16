require 'connexionz/client/connection'
require 'connexionz/client/request'

module Connexionz
  class Client
    include Connexionz::Client::Connection
    include Connexionz::Client::Request
    
    def platform(options={})
       get("rtt/public/utility/file.aspx?contenttype=SQLXML&Name=Platform.xml", options)
     end
    
  end
end

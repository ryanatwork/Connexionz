require 'connexionz/client/connection'
require 'connexionz/client/request'

module Connexionz
  class Client
    include Connexionz::Client::Connection
    include Connexionz::Client::Request

  end
end
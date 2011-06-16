require 'connexionz/client/connection'
require 'connexionz/client/request'
require 'connexionz/client/platforms'

module Connexionz
  class Client
    include Connexionz::Client::Connection
    include Connexionz::Client::Request
    include Connexionz::Client::Platforms
  end
end

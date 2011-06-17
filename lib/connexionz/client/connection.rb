require 'faraday_middleware'

module Connexionz
  class Client
    module Connection
      private
      
      def connection(raw=false)
        options = {
          :url => endpoint
        }

        Faraday.new(options) do |connection|
          connection.use Faraday::Request::UrlEncoded
          connection.use Faraday::Response::RaiseError
          connection.use Faraday::Response::Rashify
          connection.use Faraday::Response::ParseXml
          connection.adapter (adapter)
        end
      end
    end
  end
end

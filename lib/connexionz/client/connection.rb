require 'faraday_middleware'

module Connexionz
  class Client
    module Connection
      private

      def connection
        Faraday.new(:url => 'http://businfo.santa-clarita.com/') do |connection|
          connection.use Faraday::Request::UrlEncoded
          connection.use Faraday::Response::RaiseError
          connection.use Faraday::Response::Rashify
          connection.use Faraday::Response::ParseXML
          connection.adapter(Faraday.default_adapter)
        end
      end
    end
  end
end
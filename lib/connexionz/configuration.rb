require 'faraday'
require 'connexionz/version'

module Connexionz
  module Configuration
    VALID_OPTIONS_KEYS = [
      :adapter,
      :endpoint,
      :format,
      :proxy,
      :user_agent].freeze

    VALID_FORMATS = [
      :xml].freeze

    DEFAULT_ADAPTER      = :patron #Faraday.default_adapter
    DEFAULT_ENDPOINT     = nil
    DEFAULT_FORMAT       = :xml
    DEFAULT_PROXY        = nil
    DEFAULT_USER_AGENT   = "Connexionz Ruby Gem #{Connexionz::VERSION}".freeze

    attr_accessor *VALID_OPTIONS_KEYS

    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def options
      VALID_OPTIONS_KEYS.inject({}){|o,k| o.merge!(k => send(k)) }
    end

    def reset
      self.adapter      = DEFAULT_ADAPTER
      self.endpoint     = DEFAULT_ENDPOINT
      self.format       = DEFAULT_FORMAT
      self.proxy        = DEFAULT_PROXY
      self.user_agent   = DEFAULT_USER_AGENT
    end
  end
end
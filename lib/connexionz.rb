require 'connexionz/configuration'
require 'connexionz/client'

module Connexionz
  extend Configuration
  # Alias for Connexionz::Client.new
  #
  # @return [Connexionz::Client]
  def self.client(options={})
    Connexionz::Client.new(options)
  end

  # Delegate to Connexionz::Client
  def self.method_missing(method, *args, &block)
    return super unless new.respond_to?(method)
    client.send(method, *args, &block)
  end

  def self.respond_to?(method, include_private=false)
    client.respond_to?(method, include_private) || super(method, include_private)
  end
end
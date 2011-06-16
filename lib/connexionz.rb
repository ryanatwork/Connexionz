require 'connexionz/client'

module Connexionz
  # Alias for Connexionz::Client.new
  #
  # @return [Connexionz::Client]
  def self.new
    Connexionz::Client.new
  end

  # Delegate to Connexionz::Client
  def self.method_missing(method, *args, &block)
    return super unless new.respond_to?(method)
    new.send(method, *args, &block)
  end

  def self.respond_to?(method, include_private=false)
    new.respond_to?(method, include_private) || super(method, include_private)
  end
end
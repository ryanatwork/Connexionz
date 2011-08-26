require 'helper'

describe Connexionz do
  after do
    Connexionz.reset
  end

  describe ".respond_to?" do
    it "should be true if method exists" do
      Connexionz.respond_to?(:client, true).should be_true
    end
  end

  describe ".client" do
    it "should be a Connexionz::Client" do
      Connexionz.client.should be_a Connexionz::Client
    end
  end
end

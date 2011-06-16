require 'helper'

describe Connexionz do
  describe ".new" do
    it "should return a Connexionz::Client" do
      Connexionz.new.should be_a Connexionz::Client
    end
  end
end
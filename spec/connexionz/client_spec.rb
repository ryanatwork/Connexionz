require 'helper'

describe Connexionz::Client do
  before do
    @client = Connexionz.new
  end
  
  describe "#platform" do
    it "should return a list of all the platforms" do
      test = @client.platform
      test.platforms.platform[1].platform_no.should == "12412"
    end
  end
  
  describe "#platform_group" do
    it "should return a list of all the platforms" do
      test = @client.platform_group
      test.platformgoups.platformgroup[1].name.should == "Ave Stanford & Rye Cyn"
    end
  end
  
end
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
      test.platform_groups.platform_group[1].name.should == "Ave Stanford & Rye Cyn"
    end
  end
  
  describe "#route_position_et" do
    it "should return the ET for the current bus stop" do
      test = @client.route_position_et({:platformno => "16890"})
      test.routepositionet.platform.platformtag.should == "McBean Pky & Valencia Blvd"
    end
  end
  
end
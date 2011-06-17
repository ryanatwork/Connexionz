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
  
  #describe "#route_pattern" do
  #  it "should return all the route patterns" do
  #    test = @client.route_pattern
  #    test.routepattern.project.route.destination_name = "Ave Stanford & Rye Cyn"
  #  end
  #end
  
  describe "#route_position_et" do
    it "should return the ET for the current bus stop" do
      test = @client.route_position_et({:platformno => "16890"})
      test.route_position_et.platform.name.should == "McBean Pky & Valencia Blvd"
    end
  end
  
  describe "#schedule_master" do
    it "should return the master schedule list" do
      test = @client.schedule_master
      test.schedule_master.project.schedule.route[0].name.should == "Whites Cyn/Castaic"
    end
  end
  
  describe "#schedule_detail" do
    it "should return the schedule detail for the correct route id" do
      test = @client.schedule_detail("Weekday",{:id => "1"})
      test.schedule_detail.route.destination_group.name.should == "Castaic to Whites Cyn"
    end
  end
  
end
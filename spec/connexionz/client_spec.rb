require 'helper'

describe Connexionz::Client do
  describe ".new" do
     it "should return a Connexionz::Client" do
       Connexionz::Client.new.should be_a Connexionz::Client
     end
   end

  before do
    @client = Connexionz::Client.new({:endpoint => "http://12.233.207.166"})
  end

  describe "#platform" do
    it "should return a list of all the platforms" do
      stub_request(:get, "http://12.233.207.166/rtt/public/utility/file.aspx?Name=Platform.xml&contenttype=SQLXML").
        to_return(:status => 200, :body => fixture("platform.xml"))
      test = @client.platform
      test.platforms.platform[1].platform_no.should == "12412"
    end
  end

  describe "#platform_group" do
    it "should return a list of all the platforms" do
    stub_request(:get, "http://12.233.207.166/rtt/public/utility/file.aspx?Name=PlatformGroup.xml&contenttype=SQLXML").
      to_return(:status => 200, :body => fixture("platform_group.xml"))
      test = @client.platform_group
      test.platform_groups.platform_group[1].name.should == "Ave Stanford & Rye Cyn"
    end
  end

  describe "#route_pattern" do
    pending it "should return all the route patterns" do
      stub_request(:get, "http://12.233.207.166/rtt/public/utility/file.aspx?Name=RoutePattern.rxml&contenttype=SQLXML").
        to_return(:status => 200, :body => fixture("route_pattern.xml"))
      test = @client.route_pattern
      test.routepattern.project.route.destination_name = "Ave Stanford & Rye Cyn"
    end
  end

  describe "#route_position_et" do
    it "should return the ET for the current bus stop" do
    stub_request(:get, "http://12.233.207.166/rtt/public/utility/file.aspx?Name=RoutePositionET.xml&contenttype=SQLXML&platformno=10246").
      to_return(:status => 200, :body => fixture("route_position_et.xml"))
      test = @client.route_position_et({:platformno => "10246"})
      test.route_position_et.platform.name.should == "McBean Pky & Town Center Dr"
    end
  end

  describe "#schedule_master" do
    it "should return the master schedule list" do
      stub_request(:get, "http://12.233.207.166/rtt/public/utility/file.aspx?Name=ScheduleMaster.xml&contenttype=SQLXML").
        to_return(:status => 200, :body => fixture("schedule_master.xml"))
      test = @client.schedule_master
      test.schedule_master.project.schedule.route[0].name.should == "Whites Cyn/Castaic"
    end
  end

  describe "#schedule_detail" do
    it "should return the schedule detail for the correct route id" do
      stub_request(:get, "http://12.233.207.166/rtt/public/utility/file.aspx?Name=ScheduleDetail.xml&ServiceName=Weekday&contenttype=SQLXML&id=1").
        to_return(:status => 200, :body => fixture("schedule_detail.xml"))
      test = @client.schedule_detail("Weekday",{:id => "1"})
      test.schedule_detail.route.destination_group.name.should == "Castaic to Whites Cyn"
    end
  end

end

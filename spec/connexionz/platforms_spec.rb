require 'helper'

describe Connexionz::Client::Platforms do

  before do
    @client = Connexionz::Client.new
  end

  describe ".platform" do
    before do
      stub_get("rtt/public/utility/file.aspx?contenttype=SQLXML&Name=Platform.xml").
        to_return(:status => 200, :body => fixture("platform.xml"))
    end
    
    it "should return a list of all the platforms" do
      test = @client.platform()
      a_get("rtt/public/utility/file.aspx?contenttype=SQLXML&Name=Platform.xml").should have_been_made
      test.platforms.platform[0].tag.should == 15
    end
  end

end
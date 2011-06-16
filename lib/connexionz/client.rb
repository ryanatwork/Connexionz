require 'connexionz/client/connection'
require 'connexionz/client/request'

module Connexionz
  class Client
    include Connexionz::Client::Connection
    include Connexionz::Client::Request
    
    def platform(options={})
       get("rtt/public/utility/file.aspx?contenttype=SQLXML&Name=Platform.xml", options)
    end
    
    def platform_group(options={})
       get("rtt/public/utility/file.aspx?contenttype=SQLXML&Name=PlatformGroup.xml", options)
    end
    
    def route_position_et(options={})
       get("rtt/public/utility/file.aspx?contenttype=SQLXML&Name=RoutePositionET.xml", options)
    end
    
    def schedule_master(options={})
       get("rtt/public/utility/file.aspx?contenttype=SQLXML&Name=ScheduleMaster.xml", options)
    end
    
    def schedule_detail(servicename, options={})
       get("rtt/public/utility/file.aspx?contenttype=SQLXML&Name=ScheduleDetail.xml&ServiceName=#{servicename}", options)
    end
    
  end
end

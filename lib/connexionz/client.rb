require 'connexionz/client/connection'
require 'connexionz/client/request'

module Connexionz
  class Client
    attr_accessor *Configuration::VALID_OPTIONS_KEYS
    
    def initialize(options={})
      options = Connexionz.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end
    
    include Connexionz::Client::Connection
    include Connexionz::Client::Request
        
    # Returns all platform locations (WGS84), Id’s & names.
    #
    # @param options [Hash] A customizable set of options. 
    # @return {Hash}
    # @example
    #   Connexionz.platform
    def platform(options={})
       get("rtt/public/utility/file.aspx?contenttype=SQLXML&Name=Platform.xml", options)
    end
    
    # Returns details platform groups where a number of platforms are grouped together under a common name. Use PlatformTag to link to the platform locations in the above.
    #
    # @param options [Hash] A customizable set of options. 
    # @return {Hash}
    # @example
    #   Connexionz.platform_group    
    def platform_group(options={})
       get("rtt/public/utility/file.aspx?contenttype=SQLXML&Name=PlatformGroup.xml", options)
    end
 
    # Route patterns, details all the route patterns (described in the MapInfo MIB/MIF CDATA entities) in the system & the associated platforms. Use PlatformTag to link to the platform locations.
    #
    # @param options [Hash] A customizable set of options. 
    # @return {Hash}
    # @example
    #   Connexionz.route_pattern     
    #def route_pattern(options={})
    #   get("rtt/public/utility/file.aspx?contenttype=SQLXML&Name=RoutePattern.rxml", options)
    #end
    
    # Provide ETA predictions for an individual platform or platform group.Use PlatformTag (internal key to a platform) or PlatformNo (number physically attached to a bus stop which may change from time to time) arguments.
    #
    # @param options [Hash] A customizable set of options. 
    # @param options PlatformNo [String] The number posted on the bus stop
    # @param options PlatformTag [String] The ID of the bus stop
    # @return {Hash}
    # @example
    #   Connexionz.route_position_et
    #   Connexionz.route_position_et({:PlatformNo =>"19812"})
    #   Connexionz.route_position_et({:PlatformTag =>"428"})       
    def route_position_et(options={})
       get("rtt/public/utility/file.aspx?contenttype=SQLXML&Name=RoutePositionET.xml", options)
    end

    # Returns the master list of schedules
    #
    # @param options [Hash] A customizable set of options. 
    # @return {Hash}
    # @example
    #   Connexionz.schedule_master 
    def schedule_master(options={})
       get("rtt/public/utility/file.aspx?contenttype=SQLXML&Name=ScheduleMaster.xml", options)
    end
    
    # Returns the schedule detail for the route. 
    #
    # @param servicename [String] Weekday, Saturday, Sunday
    # @param options [Hash] A customizable set of options. 
    # @param options id [String] The ID of the route number
    # @return {Hash}
    # @example
    #   Connexionz.schedule_detail("Weekday")
    #   Connexionz.schedule_detail("Weekday", {:id =>"1"})
    def schedule_detail(servicename, options={})
       get("rtt/public/utility/file.aspx?contenttype=SQLXML&Name=ScheduleDetail.xml&ServiceName=#{servicename}", options)
    end
    
  end
end

module Connexionz
  class Client
    module Platforms
      
      def platform(options={})
        get("rtt/public/utility/file.aspx?contenttype=SQLXML&Name=Platform.xml", options)
      end
      
    end
  end
end
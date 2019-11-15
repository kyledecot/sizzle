require "sizzle/ios/client"

class Sizzle 
  class IOS
    class Device
      def self.create(options = {})
        CLIENT.create_device(options.slice(:name, :udid, :platform))
      end 

      def self.list(options = {})
        CLIENT.devices(limit: options[:limit])[:data]
      end 
    end 
  end 
end 

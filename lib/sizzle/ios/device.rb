require "app_store_connect"

class Sizzle 
  class IOS
    class Device 
      def self.create(name:, udid:, platform:)
        client.create_device(
          name: name, 
          udid: udid, 
          platform: platform
        )
      end 

      def self.list(limit:)
        client.devices(limit: limit)[:data]
      end 

      def self.client
        AppStoreConnect::Client.new 
      end 
    end 
  end 
end 

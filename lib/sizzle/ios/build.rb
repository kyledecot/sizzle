require "app_store_connect"

class Sizzle 
  class IOS
    class Build 
      def self.list
        client.builds[:data]
      end 

      def self.client
        AppStoreConnect::Client.new 
      end 
    end 
  end 
end 

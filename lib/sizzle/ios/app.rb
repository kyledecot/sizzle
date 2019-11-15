require "sizzle/ios/client"

class Sizzle 
  class IOS
    class App 
      def self.list
        CLIENT.apps[:data]
      end 
    end 
  end 
end 

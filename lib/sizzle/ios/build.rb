require "sizzle/ios/client"

class Sizzle 
  class IOS
    class Build
      def self.list
        CLIENT.builds[:data]
      end 
    end 
  end 
end 

require "sizzle/ios/client"

class Sizzle 
  class IOS
    class Device
      ATTRIBUTES = %i[id udid device_class model name platform status added_date].freeze

      attr_reader *ATTRIBUTES

      def initialize(options = {})
        ATTRIBUTES.each do |attribute|
          instance_variable_set("@#{attribute}", options[attribute])
        end 
      end 
      
      def to_h 
        Hash[ATTRIBUTES.map { |a| [a, instance_variable_get("@#{a}")] }]
      end 

      def self.create(options = {})
        CLIENT.create_device(options.slice(ATTRIBUTES))
      end 

      def self.list(options = {})
        CLIENT.devices(limit: options[:limit])[:data].map do |result|
          new(result[:attributes].merge(id: result[:id]))
        end 
      end 
    end 
  end 
end 

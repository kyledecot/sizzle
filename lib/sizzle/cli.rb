require "gli"
require "colorize"
require "terminal-table"

require "sizzle/ios/device"

class Sizzle 
  class CLI 
    extend GLI::App
    
    command :ios do |ios|
      ios.command :devices do |devices|
        devices.command :create do |create|
          create.flag :name
          create.flag :udid
          create.flag :platform

          create.action do |global, options, args|
            puts IOS::Device.create(
              name: options[:name], 
              udid: options[:udid], 
              platform: options[:platform]
            )
          end 
        end 

        devices.command :list do |list|
          list.flag :limit, :type => Integer, :default_value => 100

          list.action do |global, options, args|
            devices = IOS::Device.list(limit: options[:limit])


            puts Terminal::Table.new(
              :title => 'Devices'.green,
              :rows => devices.map { |d| d.to_h.values }
            )
          end 
        end 
      end 
    end 
  end 
end 

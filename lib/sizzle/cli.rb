require "gli"
require "colorize"
require "terminal-table"

require "sizzle/ios/device"
require "sizzle/ios/build"

class Sizzle 
  class CLI 
    extend GLI::App
    
    command :ios do |ios|
      ios.command :builds do |builds|
        builds.command :list do |list|
          list.action do |global, options, args|
            puts Terminal::Table.new(
              title: "Builds".green,
              rows: IOS::Build.list.map { |b| b[:attributes].values }
            )          
          end 
        end 
      end 

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
            puts Terminal::Table.new(
              :title => 'Devices'.green,
              :rows => IOS::Device.list(limit: options[:limit]).map { |d| d[:attributes].values },
            )
          end 

        end 

      end 

      ios.command :apps do |apps|
        apps.action do 
          require 'app_store_connect'

          app_store_connect = AppStoreConnect::Client.new
          apps = app_store_connect.apps

          table = Terminal::Table.new(
            :title => 'Apps',
            :rows => app_store_connect.apps[:data].map { |d| d[:attributes].values },
          )

          puts table
        end 
      end 
    end 
  end 
end 

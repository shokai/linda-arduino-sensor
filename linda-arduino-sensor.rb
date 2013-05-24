#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra/rocketio/linda/client'
require 'arduino_firmata'
$stdout.sync = true

arduino = ArduinoFirmata.connect

url = ARGV.shift || "http://linda.masuilab.org"
puts "connecting.. #{url}"
linda = Sinatra::RocketIO::Linda::Client.new url
ts = linda.tuplespace["delta"]

linda.io.on :connect do  ## RocketIO's "connect" event
  puts "connect!! <#{session}>"
end

linda.io.on :disconnect do
  puts "RocketIO disconnected.."
end

linda.wait do
  light = arduino.analog_read 0
  puts "light : #{light}"
  ts.write ["sensor", "light", light]
end

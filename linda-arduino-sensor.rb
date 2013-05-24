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

loop do
  light = arduino.analog_read 0
  puts "light : #{light}"
  ts.write ["sensor", "light", light]
  temp  = arduino.analog_read(1).to_f*5*100/1024
  puts "temperature : #{temp}"
  ts.write ["sensor", "temperature", temp]
  sleep 1
end

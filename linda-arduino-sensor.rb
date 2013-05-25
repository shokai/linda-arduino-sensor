#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra/rocketio/linda/client'
require 'arduino_firmata'
$stdout.sync = true

arduino = ArduinoFirmata.connect ENV["ARDUINO"]

url   = ENV["LINDA_BASE"]  || ARGV.shift || "http://localhost:5000"
space = ENV["LINDA_SPACE"] || "test"
puts "connecting.. #{url}"
linda = Sinatra::RocketIO::Linda::Client.new url
ts = linda.tuplespace[space]

linda.io.on :connect do  ## RocketIO's "connect" event
  puts "connect!! <#{linda.io.session}> (#{linda.io.type})"
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

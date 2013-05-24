Linda Arduino Sensor
====================
report Arduino's sensor value with RocketIO::Linda

* https://github.com/shokai/linda-arduino-sensor


Dependencies
------------
- Arduino + Firmata
- Ruby 1.8.7 ~ 2.0.0


Install Dependencies
--------------------

Install Rubygems

    % gem install bundler foreman
    % bundle install

Install Arduino Firmata v2.2

    Arduino IDE -> [File] -> [Examples] -> [Firmata] -> [StandardFirmata]


Run
---

    % bundle exec ruby linda-arduino-sensor.rb "http://linda.example.com"


Install as Service
------------------

for launchd (Mac OSX)

    % sudo foreman export launchd /Library/LaunchDaemons/ --app linda-arduino -u `whoami`
    % sudo launchctl load -w /Library/LaunchDaemons/linda-arduino-arduino-1.plist

for upstart (Ubuntu)

    % sudo foreman export upstart /etc/init/ --app linda-arduino -d `pwd` -u `whoami`
    % sudo service linda-arduino start

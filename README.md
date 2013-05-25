Linda Arduino Sensor
====================
report Arduino's sensor values with RocketIO::Linda

* https://github.com/shokai/linda-arduino-sensor


Dependencies
------------
- [Arduino Firmata](https://github.com/shokai/arduino_firmata)
- Ruby 1.8.7 ~ 2.0.0
- [LindaBase](https://github.com/shokai/linda-base)


Install Dependencies
--------------------

Install Rubygems

    % gem install bundler foreman
    % bundle install


Setup Arduino
-------------

Install Arduino Firmata v2.2

    Arduino IDE -> [File] -> [Examples] -> [Firmata] -> [StandardFirmata]


sensors
- light
  - analog input 0
  - CdS and 330Ω
- temperature
  - analog input 1
  - [LM35DZ](http://akizukidenshi.com/catalog/g/gi-00116/)


Run
---

set ENV var "LINDA_BASE" and "LINDA_SPACE"

    % export LINDA_BASE=http://linda.example.com
    % export LINDA_SPACE=test
    % bundle exec ruby linda-arduino-sensor.rb


oneline

    % LINDA_BASE=http://linda.example.com LINDA_SPACE=test  bundle exec ruby linda-arduino-sensor.rb


Install as Service
------------------

for launchd (Mac OSX)

    % sudo foreman export launchd /Library/LaunchDaemons/ --app linda-arduino -u `whoami`
    % sudo launchctl load -w /Library/LaunchDaemons/linda-arduino-arduino-1.plist

for upstart (Ubuntu)

    % sudo foreman export upstart /etc/init/ --app linda-arduino -d `pwd` -u `whoami`
    % sudo service linda-arduino start

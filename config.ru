#!/usr/bin/env rackup

require File.expand_path('../config/boot.rb', __FILE__)

run Rack::URLMap.new(
  '/' => Photopon::Welcome,
  '/qrcode' => Photopon::QRCode
)

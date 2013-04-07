#!/usr/bin/env ruby

require 'eventmachine'
require 'puppet'

$:.push File.expand_path(__FILE__)

require 'sock_puppet/http_receive_server'
require 'sock_puppet/receive_server'
require 'sock_puppet/send_server'

class SockPuppet
  MAX_QUEUE_SIZE = 5
end

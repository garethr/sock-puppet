#!/usr/bin/env ruby

require 'eventmachine'
require 'puppet'

$:.push File.expand_path(__FILE__)

require 'sock_puppet/http_receive_server'
require 'sock_puppet/receive_server'
require 'sock_puppet/send_server'

class SockPuppet
  MAX_QUEUE_SIZE = 5
  HOST = "127.0.0.1"
  SEND_PORT = 9081
  RECEIVE_PORT = 9082
end

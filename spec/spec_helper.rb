require 'eventmachine'
require 'evented-spec'

require 'coveralls'
Coveralls.wear!

$:.push File.expand_path("../../lib", __FILE__)

require 'sock_puppet'

RSpec.configure do |config|
  # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress
end

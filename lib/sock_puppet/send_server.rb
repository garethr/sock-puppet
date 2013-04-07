require 'yaml'

class SendServer < EM::Connection
  attr_reader :queue

  def initialize(queue)

    callback = Proc.new do |msg|
      out = YAML.load(msg)
      send_data("Host: #{out.host}\nStatus: #{out.status}\nMetrics: #{out.metrics}\n")
      queue.pop &callback
    end

    queue.pop &callback
  end

  def receive_data data
  end
end

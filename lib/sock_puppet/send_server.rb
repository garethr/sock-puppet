class SendServer < EM::Connection
  attr_reader :queue

  def initialize(queue)

    callback = Proc.new do |msg|
      send_data("#{msg}\n")
      queue.pop &callback
    end

    queue.pop &callback
  end

  def receive_data data
  end
end

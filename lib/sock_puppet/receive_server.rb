class ReceiveServer < EM::Connection
  attr_reader :queue

  def initialize(queue)
    @queue = queue
  end

  def receive_data(data)
    @queue.push(data)
  end
end

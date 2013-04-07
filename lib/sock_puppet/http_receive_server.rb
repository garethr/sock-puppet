require 'evma_httpserver'

class HttpReceiveServer < EventMachine::Connection
  include EventMachine::HttpServer
  attr_reader :queue

  def initialize(queue)
    @queue = queue
  end

  def process_http_request
    resp = EventMachine::DelegatedHttpResponse.new( self )

    # Block which fulfills the request
    operation = proc do
      resp.status = 200
    end

    # Callback block to execute once the request is fulfilled
    callback = proc do |r|
      @queue.push(@http_post_content)
      resp.send_response
    end

    # Let the thread pool (20 Ruby threads) handle request
    EM.defer(operation, callback)
  end
end

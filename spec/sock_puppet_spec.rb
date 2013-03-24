require 'spec_helper'
require 'thread'


describe "the send server" do
  include EventedSpec::SpecHelper
  it "should start successfully" do
    em do
      EventMachine.reactor_running?.should be_true
      queue = Queue.new
      EM.start_server "127.0.0.1", 8087, SendServer, queue
      done
    end
  end
end

describe "the http receive server" do
  include EventedSpec::SpecHelper
  it "should start successfully" do
    em do
      EventMachine.reactor_running?.should be_true
      queue = Queue.new
      EM.start_server "127.0.0.1", 8088, HttpReceiveServer, queue
      done
    end
  end
end

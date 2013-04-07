[![Build
Status](https://travis-ci.org/garethr/sock-puppet.png?branch=master)](https://travis-ci.org/garethr/sock-puppet)
[![Coverage
Status](https://coveralls.io/repos/garethr/sock-puppet/badge.png?branch=master)](https://coveralls.io/r/garethr/sock-puppet)
[![Code
Climate](https://codeclimate.com/github/garethr/sock-puppet.png)](https://codeclimate.com/github/garethr/sock-puppet)

This is still very much a work in progress so it's not particularly
configurabe or well tested yet. 

Sock Puppet is a simple Event Machine based Puppet report processor. It
listens to the standard HTTP reports from puppet and pushes some of that
information onto a TCP socket. If you're interested in the last few
reports, or watching reports come in, you can then just telnet or
otherwise to the socket and you have reports sent to your terminal.

## Usage

    bundle install
    bundle exec bin/sock-puppet

This starts the application on ports 9081 (for receiving reports from
puppet) and 9082 (for you to listen for the reports).

Now configure you puppet client to sent a report, with puppet apply you
could do something like this:

    puppet apply test.pp --reports "store,http" --reporturl http://localhost:9082/

Now to pick up the report, we'll use telnet as an example.

    telnet localhost 9091

## Todo

A few things need cleaning up if anyone finds this interesting but not
yet quite useful.

* command line flags for changing the host, ports and maximum queue size
* nice formatting of the metric information when output
* logging of anything from the application

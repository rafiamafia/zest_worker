# ZestWorker
Resque worker example that creates gverify jobs,
enqueues them and calls the gverify verification service
when worker is asked to do the job.

## Installation

Add this line to your application's Gemfile:

    gem 'zest_worker'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zest_worker

## Usage

    $ bundle console
    $ worker = ZestWorker::GverifyWorker.new
    $ worker.work
    
In command line run the rake task for resque to run the job
    
    $ TERM_CHILD=1 QUEUES=verification_service rake resque:work 

## Requirements

Install and start redis server

    $ gem install redis
    $ redis-server
    
## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

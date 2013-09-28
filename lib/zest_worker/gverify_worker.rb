 #To run this from console
require "erb"
require "resque"

module ZestWorker
  class GverifyWorker

    #Resque requires a @queue instance variable
    @queue = :verification_service
    #gverify configuration
    @config = { :username      => 'J_cwl-JL',
                :password      => 'TODO: gverify password',
                :action        => 'Test_SendInquiry',
                :api_urls      => ['https://ws1.giact.com/VerificationServices/SOAP/PublicService.asmx',
                                   'https://ws2.giact.com/VerificationServices/SOAP/PublicService.asmx'],
                :api_namespace => 'http://www.giact.com/api/verificationservices/v4.0' }
    def work
      #dispatcher gets all the payments, extracts the primary banking
      #information and gets the data ready for gverify
      params = [{ :routing_number => '000000000', :account_number =>'1111' },
                { :routing_number => '000000000', :account_number =>'2222' },
                { :routing_number => '000000000', :account_number =>'3333' },
                { :routing_number => '000000000', :account_number =>'4444' },
                { :routing_number => '000000000', :account_number =>'5555' },
                { :routing_number => '111111111', :account_number =>'1111' },
                { :routing_number => '111111111', :account_number =>'2222' },
                { :routing_number => '111111111', :account_number =>'3333' },
                { :routing_number => '111111111', :account_number =>'4444' },
                { :routing_number => '111111111', :account_number =>'5555' },
                { :routing_number => '111111111', :account_number =>'6666' },
                { :routing_number => '222222222', :account_number =>'1111' },
                { :routing_number => '333333333', :account_number =>'0000' },
                { :routing_number => '333333333', :account_number =>'1111' },
                { :routing_number => '333333333', :account_number =>'2222' },
                { :routing_number => '333333333', :account_number =>'3333' },
                { :routing_number => '333333333', :account_number =>'4444' },
                { :routing_number => '444444444', :account_number =>'1111' },
                { :routing_number => '444444444', :account_number =>'2222' },
                { :routing_number => '444444444', :account_number =>'3333' },
                { :routing_number => '444444444', :account_number =>'4444' }]

      puts "Queuing gverify jobs."
      #What allows us to add a job to a queue. Resque#enqueue Klass, *args
      #klass ia real Ruby class and not a string or reference
      Resque.enqueue(GverifyWorker, params)
    end

    #A worker requires a perform method. Resque looks for this
    #method and processes a given job when asked to do so.
    def self.perform(params)
      service = Gverify::VerificationService.new @config

      params.each do |bank|
        puts "Next gverify job being processed with param " +
             "#{bank["account_number"]} and #{bank["routing_number"]}."

        service.verify bank
      end
    end
  end
end

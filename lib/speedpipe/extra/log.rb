module Speedpipe
    module Log
        @logger = Logger.new("log-#{Time.now.utc}.txt")
        def self.info(step, text)
            @logger.info(text)
            Speedpipe::Api.insert('info', step, text)
        end

        def self.debug(step, text)
            @logger.debug(text)
            Speedpipe::Api.insert('debug', step, text)
        end

        def self.error(step, text)
            @logger.error(text)
            Speedpipe::Api.insert('error', step, text)
        end
    end
end

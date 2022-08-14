module Speedpipe
    module Config
        @id = SecureRandom.uuid
        def self.id
            @id
        end
    end
end

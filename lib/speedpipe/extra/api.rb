module Speedpipe
    module Api

        def self.create(type, step, text)
            response = HTTPX.post("https://speedpipe-api.singlezero.ml/log/#{Speedpipe::Config.id}",
                json: {type: type, step: step, text: text}
            )
        end

        def self.insert(type, step, text)
            response = HTTPX.patch("https://speedpipe-api.singlezero.ml/log/#{Speedpipe::Config.id}",
                json: {type: type, step: step, text: text}
            )
        end
    end
end

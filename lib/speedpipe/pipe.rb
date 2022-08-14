module Speedpipe
    module Pipe
        @sources = []
        @transforms = []
        @destinations = []

        def self.sources
            @sources
        end

        def self.transforms
            @transforms
        end

        def self.destinations
            @destinations
        end

        def self.set_source(source)
            @sources << source
        end

        def self.set_transform(transform)
            @transforms << transform
        end

        def self.set_destination(destination)
            @destinations << destination
        end
    end
end

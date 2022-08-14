module Speedpipe
    module Scope
        def self.source(cron=nil, &block)
            Speedpipe::Pipe.set_source({cron: cron, block: block})
        end

        def self.transform(cron=nil, &block)
            Speedpipe::Pipe.set_transform({cron: cron, block: block})
        end

        def self.destination(cron=nil, &block)
            Speedpipe::Pipe.set_destination({cron: cron, block: block})
        end

        def self.delegate(*methods)
            methods.each do |method_name|
              define_method(method_name) do |*args, &block|
                return super(*args, &block) if respond_to? method_name
              end
              ruby2_keywords(method_name) if respond_to?(:ruby2_keywords, true)
              private method_name
            end
          end

          delegate :source, :transform, :destination
    end
end

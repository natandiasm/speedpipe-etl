module Speedpipe
    module Runner
      @data = []

      def self.run
        run_sources()
        run_transform()
        run_destination()
      end

      def self.run_sources
        begin
          CLI::UI::Frame.divider('Sources')
          Speedpipe::Pipe.sources.each_with_index do |source, index|
            puts CLI::UI.fmt "{{*}} Running Source [#{index}]"
            return_source = source[:block].call
            if return_source.class == Array
              @data.concat return_source
            else
              @data << return_source
            end
            puts CLI::UI.fmt "{{v}} sucess"
            Speedpipe::Log.info('sources',  "Run [#{index} source] sucess!")
          end
        rescue => exception
          puts CLI::UI.fmt "{{x}} error"
          Speedpipe::Log.error('source', exception)
          raise exception
        end
      end
      private_class_method :run_sources

      def self.run_transform
        begin
          CLI::UI::Frame.divider('Transforms')
          transforms = Speedpipe::Pipe.transforms
          unless transforms.empty?
              transform_data = []
              transforms.each_with_index do |transform, index|
                puts CLI::UI.fmt "{{*}} Running Transforms [#{index}]"
                return_transform = transform[:block].call @data
                if return_transform.class == Array
                  transform_data.concat return_transform
                else
                  transform_data << return_transform
                end
                puts CLI::UI.fmt "{{v}} sucess"
                Speedpipe::Log.info('transform', "Run [#{index} transform] sucess!")
              end
              @data = transform_data
          end
        rescue => exception
          puts CLI::UI.fmt "{{x}} error"
          Speedpipe::Log.error('transform', exception)
          raise exception
        end
      end
      private_class_method :run_transform

      def self.run_destination
        begin
          CLI::UI::Frame.divider('Destinations')
            destinations = Speedpipe::Pipe.destinations
            unless destinations.empty?
              CLI::UI::Spinner.spin("Running destinations") do |spinner|
                destinations.each_with_index do |destination, index|
                  puts CLI::UI.fmt "{{*}} Running Destinations [#{index}]"
                  destination[:block].call @data
                  puts CLI::UI.fmt "{{v}} sucess"
                  Speedpipe::Log.info('destination', "Run [#{index} destination] sucess!")
                end
              end
            end
        rescue => exception
          puts CLI::UI.fmt "{{x}} error"
          Speedpipe::Log.error('destination', exception)
          raise exception
        end
      end
      private_class_method :run_destination
    end
end

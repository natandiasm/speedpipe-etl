require 'cli/ui'
require 'logger'
require 'securerandom'
require 'httpx'
require 'pry'

require_relative 'speedpipe/parser'
require_relative 'speedpipe/pipe'
require_relative 'speedpipe/scope'
require_relative 'speedpipe/delegate'
require_relative 'speedpipe/runner'
require_relative 'speedpipe/config'

require_relative 'speedpipe/extra/log'
require_relative 'speedpipe/extra/api'

module Speedpipe
    def self.run()
        CLI::UI::StdoutRouter.enable
        CLI::UI::Frame.open('Speedpipe') do
            #raise "Speedpipe need set a file to run" if ARGV[0].nil?
            Speedpipe::Parser.parse(File.expand_path($0))
            puts CLI::UI.fmt "{{*}} Create new log file"
            Speedpipe::Api.create('info','init', 'created log')
            puts CLI::UI.fmt "{{*}} Log online https://speedpipe.ml/log/#{Speedpipe::Config.id}"
            begin
                Speedpipe::Runner.run
                Speedpipe::Log.info('end', "sucess")
            rescue => exception
                Speedpipe::Log.error('end', "failure")
            end
        end
    end
end

extend Speedpipe::Scope

Speedpipe.run

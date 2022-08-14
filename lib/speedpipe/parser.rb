module Speedpipe
    module Parser
        def self.parse(file)
            Speedpipe::Scope.instance_eval clear_file(file)
        end

        def self.clear_file(file)
            # Remove re-import gem
            file_clear = ''
            IO.readlines(file).each do |line|
                file_clear += line unless line.match(/require.*speedpipe.*/)
            end
            return file_clear
        end
    end
end

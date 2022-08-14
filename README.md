![alt text](https://github.com/natandiasm/speedpipe-etl/blob/main/docs/imgs/logo-speedpipe.png?raw=true)

# SpeedPipe ETL

SpeedPipe ETL is a gem to build data pipelines in a simple and fast way.

# Get Start

SpeedPipe is a [DSL](https://en.wikipedia.org/wiki/Domain-specific_language), because of that, it's very simple to do something, just create a new file and call the specific functions.

Install the gem:

```shell
gem install speedpipe
```

Create new file:

```ruby
require 'speedpipe'

# one ou more source
source do
  [1, 2, 3, 4, 5]
end

transform do |data|
  # data is array of sources
  data.first.each { |item| item + 1 }
end

destination do |data|
  # save array one file
  array_text = data.join(', ')
  File.open('array_file.txt', 'w') { |file| file.write(array_text) }
end

```

# Documentation

Read more in [website speedpipe](https://www.speedpipe.ml/)

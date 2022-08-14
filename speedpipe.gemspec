Gem::Specification.new do |s|
    s.name        = 'speedpipe'
    s.version     = '0.0.1'
    s.summary     = "Easily create ETL data pipelines"
    s.description = "Speedpipe will help you to create data pipelines in a simple and functional way, with online logs and simple configurations."
    s.authors     = ["Natan Dias"]
    s.email       = 'natandiasm@gmail.com'
    s.files       = Dir['lib/**/*'] + [
        'README.md',
        "Gemfile",
        "speedpipe.gemspec"]
    s.homepage    =
      'https://github.com/speedpipe'
    s.license     = 'MIT'
  end

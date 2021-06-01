require 'rake'

Gem::Specification.new do |s|
    s.name        = 'phl-covid-testing'
    s.version     = '0.1.0'
    s.licenses    = ['MIT']
    s.summary     = "Command Line Application allowing users to search for COVID-19 testing locations in Philadelphia, PA."
    s.authors     = ["Brian Firestone"]
    s.email       = 'bfirestone2339@gmail.com'
    s.files       = FileList["bin/*", "lib/*", '[A-Z]*'].to_a
    s.homepage    = 'https://github.com/bfirestone23/phl-covid-testing'
    s.metadata    = { "source_code_uri" => "https://github.com/bfirestone23/phl-covid-testing" }
  end
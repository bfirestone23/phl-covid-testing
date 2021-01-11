
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "phl_covid_testing/lib/phl_covid_testing/version"

Gem::Specification.new do |spec|
  spec.name          = "phl_covid_testing"
  spec.version       = PhlCovidTesting::VERSION
  spec.authors       = ["Brian Firestone"]
  spec.email         = ["bfirestone2339@gmail.com"]

  spec.summary       = "Offers several ways to search and view details of COVID-19 testing locations in Philadelphia, PA."
  spec.homepage      = "https://github.com/bfirestone23/phl_covid_testing"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency 'pry'
  spec.add_dependency "colorize"
  spec.add_dependency "open-uri"
  spec.add_dependency "json"
  spec.add_dependency "net/http"
end

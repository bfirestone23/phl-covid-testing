require 'pry'
require 'colorize'
require 'open-uri'
require 'json'
require 'net/http'

require_relative "./concerns/Displayable"
require_relative "./concerns/Findable"
require_relative "./concerns/Inputable"

require_relative "./phl_covid_testing/version"
require_relative "./phl_covid_testing/cli"
require_relative "./phl_covid_testing/api"
require_relative "./phl_covid_testing/testing_location"


module PhlCovidTesting
  class Error < StandardError; end
end

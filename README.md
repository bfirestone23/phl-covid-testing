# PHLCovidTesting

Find and view details about COVID-19 testing locations located in Philadelphia, PA. You can search by name, zip code, and access type (walk-up or drive-thru), or view a full list and get more information on that testing location.

## Demo

[Click here to view a demo!](https://drive.google.com/file/d/1ZEUw4LmakPrCvUklisYHxCjJ122pbHTr/view?usp=sharing) 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'phl-covid-testing'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install phl-covid-testing

You can then begin the application by executing:
    $ phl-covid-testing


## Usage

There are several ways to search for testing locations (listed below). If the search returns multiple results, a numbered list of those locations is provided and the user will be prompted to enter a number to view a location's details, view all locations, go back to the main menu, or 'exit' to end the program.

### **Search By Name**


If you know of a medical facility near you that may be testing for COVID-19, enter any portion of its name to view more details.

### **Search By Zipcode**


Enter a zipcode within the city of Philadelphia to view all testing locations.

### **Search By Access**


Enter 'walk' to view all testing locations offering walk-up services, and 'drive' to view all offering drive-thru services. 

### **View All**


Enter 'all' to view a list of all testing locations. 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bfirestone23/phl_covid_testing. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PHLCovidTesting project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/phl_covid_testing/blob/master/CODE_OF_CONDUCT.md).

# Sgrind


The Sgrind CLI gem is a command line interface tool that retrieves detailed information about events from the Startup Grind website (https://www.startupgrind.com/events/). This gem will facilitate easy retrieval of information about future events, and gives the user the ability to view aggregated lists of events scheduled for the next 6 months. The user will also be able to  browse and view all event locations and drill down to events by city.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sgrind'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sgrind

## Usage

Once installed, the lines below will run the gem:


    $ ruby bin/sgrind

On starting, the user will be be given the option to browse events by title or by location.

If they choose to view events by location, they will need to select a location from a menu of global event destination that is dynamically scraped from the site, then choose an event from another menu of all events in that location. The event details for the selected item will then be returned.

If they choose to view all events by their title, they will need to select an event from a menu of all events over the next 6 months happening globally (location is appended to the event title in the menu for convenience). The event details for the selected item will then be returned. The user will have to option to search for another item or end the program.


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'schanrai'/sgrind. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Sgrind project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'schanrai'/sgrind/blob/master/CODE_OF_CONDUCT.md).

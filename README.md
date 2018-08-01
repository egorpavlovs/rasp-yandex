# Rasp::Yandex

It a simple gem for talking with [rasp.yandex API](https://tech.yandex.ru/rasp/)
Now supported only API version 3.0

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rasp-yandex'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rasp-yandex

## Usage
Before usage this gem, read [documentation](https://tech.yandex.ru/rasp/doc/concepts/about-docpage/) for the [rasp.yandex.ru](https://rasp.yandex.ru/) and take apikey from yandex.

After:

1. Initialize client:

    Rasp::Yandex::Client.new("Your apikey")

2. Use!

    client.timetable_between_stations("c146", "c213", "2018-08-01")

All methods correspond to functions from the documentation from api:

[all_stations](https://tech.yandex.ru/rasp/doc/reference/stations-list-docpage/)
[timetable_between_stations](https://tech.yandex.ru/rasp/doc/reference/schedule-point-point-docpage/) - if you want to get the schedule for a certain date, then specify it in the method, not in the default data, for example - client.timetable_between_stations ("c146", "c213", "2018-08-01"). If for all time - client.timetable_between_stations ("c146", "c213")
[timetable_at_station](https://tech.yandex.ru/rasp/doc/reference/schedule-on-station-docpage/) - In this method, the date is specified in the same way as in the previous method
[near_stations](https://tech.yandex.ru/rasp/doc/reference/query-nearest-station-docpage/)
[near_city](https://tech.yandex.ru/rasp/doc/reference/nearest-settlement-docpage/)
[stations_of_route](https://tech.yandex.ru/rasp/doc/reference/list-stations-route-docpage/)
[information_about_carrier](https://tech.yandex.ru/rasp/doc/reference/query-carrier-docpage/)
[copyright_yandex_rasp](https://tech.yandex.ru/rasp/doc/reference/query-copyright-docpage/)

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pavlovegor/rasp-yandex.

# Officevibe

An early-stage Ruby client for Officevibe.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'officevibe'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install officevibe

## Configuration

To get your auth token log in to the Officevibe app and copy the value of the officevibe.auth cookie; this can be done through the Developer Tools of your browser or any number of browser extensions (like EditThisCookie for Chrome).

```ruby
client = Officevibe::Client.new("<your auth token here>")
```

## Usage

### Get Manageable Groups

```ruby
client.get_groups
# => [
#     {
#                   "id" => "12345678-1234-5678-9012-12345678901",
#         "display_name" => "Accounting Department"
#     }
# ]
```

### Get Engagement Report

```ruby
client.get_engagement_report("12345678-1234-5678-9012-12345678901")
# => {"metric_groups"=>
#   [{"id"=>"MG-4",
#     "description"=>"The \"Relationship with Manager\" metric represents trust, communication and collaboration between employees and their direct manager.",
#     "title"=>"Relationship with Manager",
#     "is_effective"=>true,
#     "value"=>9.9,
#     "graph"=>
#      {"scale_min"=>8.1,
#       "scale_max"=>9.7,
#       "zoom"=>6.25,
#       "offset"=>0.39,
#       "min_value"=>0.0,
#       "max_value"=>10.0,
#       "interval_type"=>3,
#       "values"=>
#        [{"date"=>"2019-04-14T00:00:00Z", "value"=>9.9},
#         {"date"=>"2019-04-21T00:00:00Z", "value"=>9.9},
#         {"date"=>"2019-04-28T00:00:00Z", "value"=>9.9},
#         {"date"=>"2019-05-05T00:00:00Z", "value"=>9.9},
#         {"date"=>"2019-05-12T00:00:00Z", "value"=>9.9},
#         {"date"=>"2019-05-19T00:00:00Z", "value"=>9.9},
#         {"date"=>"2019-05-26T00:00:00Z", "value"=>9.9},
#         {"date"=>"2019-06-02T00:00:00Z", "value"=>9.9},
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/chrisb/officevibe. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Officevibe project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/chrisb/officevibe/blob/master/CODE_OF_CONDUCT.md).

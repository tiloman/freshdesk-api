# Freshdesk::Api

Yet another freshdesk api wrapper.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'freshdesk-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install freshdesk-api

## Usage

In order to use this via `bin/console` simply copy `.env.example` to `.env` and fill in your credentials.

Configure the gem. Eg. in a rails initializer.

```ruby
  Freshdesk::Api.configure do |config|
    config.api_key = 'your_api_key'
    config.domain  = 'your_namespace' # like YOUR_NAMESPACE.freshdesk.com
  end
```

After that, you will have access to classes these classes:

```ruby
  Freshdesk::Api::Company
  Freshdesk::Api::Contact
  Freshdesk::Api::Ticket
```

Use them [like this](https://github.com/rails/activeresource#find). Shouldn't be a problem, if you're familiar with `ActiveModel`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yoyostile/freshdesk-api.


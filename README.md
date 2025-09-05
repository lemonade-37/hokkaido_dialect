# HokkaidoDialect

HokkaidoDialect is a Ruby gem that provides a fun quiz to help you learn the Hokkaido dialect.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add hokkaido_dialect
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install hokkaido_dialect
```

## Usage

Start an interactive quiz in IRB:

```bash
% irb
irb(main):001> require 'hokkaido_dialect'
=> true
irb(main):002> HokkaidoDialect::QuizGame.play
```

### Play a quiz

```ruby
# 3 random questions (default)
HokkaidoDialect::QuizGame.play

# Specify the number of questions
HokkaidoDialect::QuizGame.play(5)

# Play with all questions
HokkaidoDialect::QuizGame.all
```

You will be asked multiple-choice questions on the correct usage of the Hokkaido dialect.
Enjoy the quiz and become familiar with the Hokkaido dialect! 🦀🐻🐄✨

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [hokkaido_dialect | RubyGems.org](https://rubygems.org/gems/hokkaido_dialect).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lemonade-37/hokkaido_dialect.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

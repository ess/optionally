# Optionally

This is, like, so totally just a tiny little mix-in that lets your classes
be super cereals about the stuff their methods get in options hashes, fersure.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'optionally'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install optionally

## Usage

```ruby
require 'optionally'

class Something
  include Optionally::Required

  def fersure(options = {})
    check_required_options(options, :totally)

    puts "totally #{options[:totally]}"
  end
end

s = Something.new
s.fersure(totally: 'like, freal')
#  "totally like, freal"
#  => nil

s.fersure(bummer: "gag me with a spoon")
#  ArgumentError: totally is required
#  Big Ugly Stacktrace (TM)
```

## Contributing ##

Do you use git-flow? I sure do. Please base anything you do off of
[the develop branch](https://github.com/ess/optionally/tree/develop).

1. Fork it.
2. Perform some BDD magic. Seriously. Be testing.
3. Submit a pull request.

## License ##

MIT License. Copyright 2015 Dennis Walters

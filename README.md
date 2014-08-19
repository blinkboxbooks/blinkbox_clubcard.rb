# blinkbox-clubcard

This gem can generate a random Clubcard.

## Installation

Add this line to your application's Gemfile:

    gem 'blinkbox-clubcard'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install blinkbox-clubcard

## Usage

First, include the library:

```ruby
require 'blinkbox/clubcard'
```

To generate just a number:

```ruby
# This will return a UK Clubcard number by default
number = Blinkbox::Clubcard.generate_random_number

# Which is equivalent to
number = Blinkbox::Clubcard.generate_random_number(type: Blinkbox::Clubcard::UK)

# Or
number = Blinkbox::Clubcard::UK.generate_random_number
```

Alternatively, you can have a Clubcard object created:

```ruby
# This will return a UK Clubcard by default
card = Blinkbox::Clubcard.create_random_clubcard
puts card.number

# Which is equivalent to
card = Blinkbox::Clubcard.create_random_clubcard(type: Blinkbox::Clubcard::UK)
puts card.number

# Or
card = Blinkbox::Clubcard::UK.create_random_clubcard
puts card.number
```

If you have a number and want to create a Clubcard, do so against the type of Clubcard it is:

```ruby
cc_num = 634004894376285154
card = Blinkbox::Clubcard::UK.new(cc_num)
```

Additionally, you can validate that a Clubcard number matches the type you think it is/should:

```ruby
cc_num = 634004894376285154
Blinkbox::Clubcard::UK.validate(cc_num) # returns true if good; false if bad
```

# motion-csv

![Travis Status](https://travis-ci.org/markrickert/motion-csv.png) [![Code Climate](https://codeclimate.com/github/markrickert/motion-csv.png)](https://codeclimate.com/github/markrickert/motion-csv) 

This is a RubyMotion friendly port of fasterer-csv by Mason: http://rubygems.org/gems/fasterer-csv

## Installation

Add this line to your application's Gemfile:

    gem 'motion-csv'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install motion-csv

## Usage

Check out the `specs` directory for usage examples, but here's a brief example:

```ruby
csv_string = "a,b,c,d
1,2,3,4
5,6,7,whatever"

csv = MotionCSV.parse(csv_string)

puts csv.headers # [:a, :b, :c, :d]
puts csv.first[:b] # 2
puts csv.last[:d] # "whatever"
```

## Tests

To run the testing suite, run `rake spec`.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

---
[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/markrickert/motion-csv/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

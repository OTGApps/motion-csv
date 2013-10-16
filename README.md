# motion-csv

[![Build Status](https://travis-ci.org/markrickert/motion-csv.png)](https://travis-ci.org/[markrickert/motion-csv) [![Code Climate](https://codeclimate.com/github/markrickert/motion-csv.png)](https://codeclimate.com/github/markrickert/motion-csv) 

This is a RubyMotion friendly port of fasterer-csv by Mason: http://rubygems.org/gems/fasterer-csv

## Installation

Add this line to your application's Gemfile:

    gem 'motion-csv'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install motion-csv

## Usage

Check out the `specs` directory for usage examples, but here's a few brief examples:

### Standard Usage

```ruby
csv_string = "a,b,c,d\n1,2,3,4\n5,6,7,whatever\n"
csv = MotionCSV.parse(csv_string)

puts csv.headers # [:a, :b, :c, :d]
puts csv.first[:b] # 2
puts csv.last[:d] # "whatever"
```

### Generating a CSV String

```ruby
MotionCSV.generate do |csv|
  csv << ["row", "of", "CSV", "data"]
  csv << ["another", "row"]
end
# "row,of,CSV,data\nanother,row\n"
```

### Convert an Array to CSV
This uses a convenience method on the `Array` class. You can pass it a single or two-dimensional array.

```ruby
["testing", "arrays"].to_csv
# "testing,arrays\n"
```

```ruby
[
  ['array1', 'stuff'],
  ['array2', 'more stuff']
].to_csv
# "array1,stuff\narray2,more stuff\n"
```

### Parse a String
This uses a convenience method on the `String` class.

```ruby
"header1,header2\nCSV,String".parse_csv
# [["CSV", "String"]]
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

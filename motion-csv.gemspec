# -*- encoding: utf-8 -*-
require File.expand_path('../lib/motion-csv/version', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "motion-csv"
  spec.version       = MotionCSV::VERSION
  spec.authors       = ["Mark Rickert"]
  spec.email         = ["mjar81@gmail.com"]
  spec.description   = %q{This is a RubyMotion friendly port of fasterer-csv by Mason: http://rubygems.org/gems/fasterer-csv}
  spec.summary       = %q{This is a RubyMotion friendly port of fasterer-csv by Mason: http://rubygems.org/gems/fasterer-csv}
  spec.license       = "MIT"

  files = []
  files << 'README.md'
  files.concat(Dir.glob('lib/**/*.rb'))
  spec.files         = files
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
end

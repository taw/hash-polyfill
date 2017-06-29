require "pathname"
Gem::Specification.new do |s|
  s.name         = "hash-zip"
  s.version      = "0.1.20170629"
  s.date         = "2017-06-29"
  s.summary      = "Polyfill for Hash methods ruby will get in the future"
  s.description  = "Hash#transform_values from 2.4 and well as Hash convenience methods from the future"
  s.authors      = ["Tomasz Wegrzanowski"]
  s.email        = "Tomasz.Wegrzanowski@gmail.com"
  s.files        = %W[Rakefile .rspec lib spec README.md].map{|x| Pathname(x).find.to_a.select(&:file?)}.flatten.map(&:to_s)
  s.homepage     = "https://github.com/taw/hash-zip"
  s.license      = "MIT"
  # development
  s.add_development_dependency "pry"
  # tests
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
end

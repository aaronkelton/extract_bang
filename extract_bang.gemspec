module ExtractBang
  VERSION = "0.0.1"
end

Gem::Specification.new do |s|
  s.name        = 'extract_bang'
  s.version     = ExtractBang::VERSION
  s.license     = 'Nonstandard'
  s.summary     = "Add the Array#extract! method from Rails 2.5.1"
  s.description = "Removes and returns the elements for which the block returns a true value."
  s.authors     = ["Aaron Kelton"]
  s.email       = 'aaron.k.kelton@gmail.com'
  s.homepage    = 'https://github.com/chemturion/extract_bang'
  s.files       = ["lib/extract_bang.rb"]
end

lib = File.expand_path("../lib/", __FILE__)
$:.unshift lib unless $:.include?(lib)

require "ez_model/version"
require "rmre/version"

Gem::Specification.new do |s|

  # Gem info
  s.name = "ez_model"
  s.version = ::EZModel::VERSION
  s.platform = Gem::Platform::RUBY
  s.date = "2012-04-16"
  s.summary = "Automatically generate model files from database."
  s.description = "Automatically generate model files from database."

  # Author info
  s.authors = ["Tianyu Huang"]
  s.email = ["tianhsky@yahoo.com"]
  s.homepage = "http://rubygems.org/gems/ez_model"

  # Dependencies
  #s.required_rubygems_version = ">= 1.8.22"
  s.add_dependency "activerecord", ">= 3.0.0"
  s.add_dependency "erubis", ">= 2.6.6"

  # Files
  s.files = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.extra_rdoc_files = ["README.md", "LICENSE"]
  
  


end

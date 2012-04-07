lib = File.expand_path("../lib/", __FILE__)
$:.unshift lib unless $:.include?(lib)

require "ez_model/version"
require "rmre/version"

Gem::Specification.new do |s|

  # Basic info
  s.name = "ez_model"
  s.version = ::EZModel::VERSION
  s.platform = Gem::Platform::RUBY
  s.date = "2012-04-10"
  s.summary = "Make it easier to generate easier"
  s.description = "Generate model files automatically when you have database schema created."
  s.authors = ["Tianyu Huang"]
  s.email = ["tianhsky@yahoo.com"]
  s.homepage = "http://rubygems.org/gems/ez_model"

  # Dependencies
  # s.required_rubygems_version = ">= 1.3.6"

  # Files
  s.files = `git ls-files`.split("\n")
  s.extra_rdoc_files = ["README.md"]
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }


end

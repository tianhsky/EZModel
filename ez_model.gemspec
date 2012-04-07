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
  s.summary = "Generate model files just in one command line"
  s.description = "Generate models and schema.rb from existing database just in one command line. If you prefer design ER diagram and export scripts to generate database schema, or if you have to work with a legacy database, this can save you insame amount of time. All you need to do is to have a database.yml configuraiton file in ~/config/. Besides creating all models it sets proper table name and primary key if tables and columns naming doesn’t follow Rails convention. It also tries to read all foreign keys data from a database."
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

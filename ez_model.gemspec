lib = File.expand_path("../lib/", __FILE__)
$:.unshift lib unless $:.include?(lib)

require "ez_model/version"
require "rmre/version"

Gem::Specification.new do |s|

  # Gem info
  s.name = "ez_model"
  s.version = ::EZModel::VERSION
  s.platform = Gem::Platform::RUBY
  s.date = "2012-04-08"
  s.summary = "Generate model files just in one command line"
  s.description = "Generate models and schema.rb from existing(legacy) database just in one command line. If you prefer design ER diagram and export scripts to generate database schema, or if you have to work with a legacy database, this can save you insane amount of time. All you need to do is to have a database.yml configuraiton file in ~/config/. Besides creating all models it sets proper table name and primary key if tables and columns naming doesn’t follow Rails convention. It also tries to read all foreign keys data from a database. It uses Rmre as underlying reverse engine to generate models..."

  # Author info
  s.authors = ["Tianyu Huang"]
  s.email = ["tianhsky@yahoo.com"]
  s.homepage = "http://rubygems.org/gems/ez_model"

  # Dependencies
  s.required_rubygems_version = ">= 1.3.6"
  s.add_dependency "activerecord", ">= 3.0.0"
  s.add_dependency "erubis", "~> 2.6.6"
  #s.add_development_dependency "rspec"

  # Files
  s.files = `git ls-files`.split("\n")
  s.require_paths = ["lib"]
  s.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.extra_rdoc_files = ["README.md", "LICENSE"]
  
  


end

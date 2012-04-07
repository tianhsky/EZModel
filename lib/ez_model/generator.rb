require "tmpdir"
require "fileutils"
require "erubis"

module EZModel
  module Generator
    def self.CreateModels(path, tables, overwrite=false)
      return unless tables.is_a? Array

      FileUtils.mkdir_p(path) if !Dir.exists?(path)

      tables.each do |table_name|
        _file_path = File.join(path, "#{table_name.tableize.singularize}.rb")
        if (!File.exists?(_file_path) || overwrite)
          File.open(_file_path, "w") do |file|
            _eruby = Erubis::Eruby.new(File.read(File.join(File.expand_path("../", __FILE__), 'model.eruby')))
            _eruby_file = _eruby.result(:table_name => table_name)
            file.write(_eruby_file)
          end
        end
      end
    end
  end
end
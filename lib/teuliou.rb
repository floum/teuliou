require 'teuliou/version'
require 'teuliou/book'

# the teuliou mail module
module Teuliou
  def self.build_book(directory)
    path = Pathname.new(directory).basename
    Dir.chdir(path)
    md_files = Dir.glob('*.md').map { |file| File.absolute_path(file) }
    FileUtils.remove_entry_secure('pub') if File.exist?('pub')
    Dir.mkdir('pub')
    Dir.chdir('pub')
    File.open("#{path}.tex", 'w') do |file|
      file.write(Book.new(md_files).render)
    end
    system("pdflatex #{path}.tex")
  end
end

require 'teuliou/version'
require 'teuliou/book'

# the teuliou main module
module Teuliou
  SOURCE_FILE_PATTERN = '*.md'

  PUBLICATION_DIRECTORY = 'pub'

  def self.build_book(directory)
    path = Pathname.new(directory).basename
    prepare_target_directory(path)
    files = Dir.glob(SOURCE_FILE_PATTERN)
            .map { |file| File.absolute_path(file) }
    Dir.chdir(PUBLICATION_DIRECTORY)
    book = Book.new(path, files)
    book.write_tex
    system("pdflatex #{path}.tex")
  end

  def self.prepare_target_directory(path)
    Dir.chdir(path)
    FileUtils.remove_entry_secure(PUBLICATION_DIRECTORY) if File.exist?('pub')
    Dir.mkdir(PUBLICATION_DIRECTORY)
  end
end

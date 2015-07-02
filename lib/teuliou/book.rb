require 'erb'
require 'pandoc-ruby'

module Teuliou
  # the teuliou book class
  class Book
    TEMPLATE_FILE = File.join(File.dirname(__FILE__), 'layouts/book.tex.erb')

    def initialize(name, files)
      @name = name
      @template = ERB.new(File.read(TEMPLATE_FILE))
      @files = files
    end

    def content
      @files.sort.map { |file| File.read(file) }.join("\n")
    end

    def render
      @content = PandocRuby.new(content, from: :markdown, to: :latex)
      @template.result binding
    end

    def write_tex
      File.open("#{@name}.tex", 'w') do |file|
        file.write(render)
      end
    end
  end
end

require 'erb'
require 'pandoc-ruby'

module Teuliou
  # the teuliou book class
  class Book
    TEMPLATE_FILE = File.join(File.dirname(__FILE__), 'layouts/book.tex.erb')

    def initialize(files)
      @template = ERB.new(File.read(TEMPLATE_FILE))
      @title = 'Book Stub'
      text = files.sort.map { |file| File.read(file) }.join("\n")
      @content = PandocRuby.new(text, from: :markdown, to: :latex)
    end

    def render
      @template.result binding
    end
  end
end

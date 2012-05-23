require 'kramdown/parser/kramdown'

module Kramdown
  module Parser
    class BeanKramdown < Kramdown

      # Array with all the parsing methods that should be removed from the standard kramdown parser.
      EXCEPT = [:codeblock_fenced, :block_extensions, :span_extensions]

      # initialise new parsers
      def initialize(source, options)
        super
        
        @block_parsers.unshift(:info_box)
        @span_parsers.unshift(:oembed)
        
        @block_parsers.delete_if {|i| EXCEPT.include?(i)}
        @span_parsers.delete_if {|i| EXCEPT.include?(i)}
      end

      require "kramdown/bean_kramdown/info_box"
      require "kramdown/bean_kramdown/oembed"
      require 'kramdown/converter/bean_html'
    end
  end
end
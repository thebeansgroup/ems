require 'rexml/parsers/baseparser'

module Kramdown

  module Converter

    # Converts a Kramdown::Document to HTML.
    #
    # You can customize the HTML converter by sub-classing it and overriding the +convert_NAME+
    # methods. Each such method takes the following parameters:
    #
    # [+el+] The element of type +NAME+ to be converted.
    #
    # [+indent+] A number representing the current amount of spaces for indent (only used for
    #            block-level elements).
    #
    # The return value of such a method has to be a string containing the element +el+ formatted as
    # HTML element.
    class Html < Base
      
      def convert_info_box(el, indent)
        if el.attr['class']
          el.attr['class'] = el.attr['class'].include?('test') ?
              el.attr['class'] :
              el.attr['class'].split.unshift('test').reject(&:empty?).join(' ')
        else
          el.attr['class'] = 'infoBox'
        end

        "#{' '*indent}<div#{html_attributes(el.attr)}>\n#{inner(el, indent)}#{' '*indent}</div>\n"
      end
      
      def convert_oembed(el, indent)
        provider = el.attr['provider_name']
        el.attr['provider_name'] = nil
        el_id = ""
        if el.attr['html']
          oembed_html = el.attr['html']
          el.attr['html'] = nil
        end
        if el.attr['id']
          el_id = " aria-labelledby=\"#{el.attr['id']}\""
          el.attr['id'] = nil
        end
        if el.attr['role'] === "img"
          "#{' '*indent}<figure%s#{html_attributes(el.attr)}>#{inner(el, indent)}</figure>\n" % el_id
        else
          if provider.casecmp "twitter"
             "#{' '*indent}<figure#{html_attributes(el.attr)}>#{oembed_html}#{inner(el, indent)}</figure>\n"
          else
            "#{' '*indent}<figure%s#{html_attributes(el.attr)}>#{oembed_html}#{inner(el, indent)}</figure>\n" % el_id
          end
        end
      end
      
      def convert_figure(el, indent)
        "#{' '*indent}<figure#{html_attributes(el.attr)}>#{inner(el, indent)}</figure>\n"
      end
      
      def convert_figCaption(el, indent)
        id = ""
        if el.attr['id']
          id = " id=\"#{el.attr['id']}\""
          el.attr['id'] = nil
        end
         "#{' '*indent}<figCaption%s#{html_attributes(el.attr)}>#{escape_html(el.value)}</figCaption>\n" % id
      end
      
    end
  end
end
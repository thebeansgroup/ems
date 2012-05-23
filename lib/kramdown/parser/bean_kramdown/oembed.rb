# -*- coding: utf-8 -*-
#
#--
# Copyright (C) 2009-2012 Thomas Leitner <t_leitner@gmx.at>
#
# This file is part of kramdown.
#
# kramdown is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#++
#

#
# This file has been edited to suit the needs of The Beans Group Ltd. Changes were made to the types of media availbable
# images keep their ! however new types are ? for oembedd etc
# If you wish to change the types of media you need to change the OEMBED_START constant to include your special symbol 
# for the new media object as well as change the reg ex on the parser definition towards the bottom of this file.
#

require 'open-uri'
require 'cgi'
require 'json'

module Kramdown
  module Parser
    class BeanKramdown

      # Normalize the oembed identifier.
      def normalize_oembed_id(id)
        id.gsub(/(\s|\n)+/, ' ').downcase
      end

      OEMBED_DEFINITION_START = /^#{OPT_SPACE}\[([^\n\]]+)\]:[ \t]*(?:<(.*?)>|([^'"\n]*?\S[^'"\n]*?))[ \t]*?(?:\n?[ \t]*?(["'])(.+?)\4[ \t]*?)?\n/

      # Parse the oembed definition at the current location.
      def parse_oembed_definition
        @src.pos += @src.matched_size
        oembed_id, oembed_url, oembed_title = normalize_oembed_id(@src[1]), @src[2] || @src[3], @src[5]
        warning("Duplicate oembed ID '#{oembed_id}' - overwriting") if @oembed_defs[oembed_id]
        @oembed_defs[oembed_id] = [oembed_url, oembed_title]
        @tree.children << Element.new(:eob, :oembed_def)
        true
      end
      define_parser(:oembed_definition, OEMBED_DEFINITION_START)


      # This helper methods adds the approriate attributes to the element +el+ of type +a+ or +img+
      # and the element itself to the @tree.
      def add_oembed(el, href, title, alt_text = nil)
        
        providers = {
          :twitter         => "https://api.twitter.com/1/statuses/oembed.json?url=%s&lang=en",
          :youtube         => "http://www.youtube.com/oembed?url=%s&format=json&maxwidth=550",
          :flickr          => "http://flickr.com/services/oembed?url=%s&maxwidth=460&format=json&maxwidth=550",
          :vidler          => "http://lab.viddler.com/services/oembed/?url=%s&type=simple&format=json",
          :qik             => "http://qik.com/api/oembed.json?url=%s&maxwidth=550",
          :revision3       => "http://revision3.com/api/oembed/?url=%s&format=json&maxwidth=550",
          :hulu            => "http://www.hulu.com/api/oembed.json?url=%s&maxwidth=550",
          :vimeo           => "http://vimeo.com/api/oembed.json?url=%s&maxwidth=550",
          :collegehumor    => "http://www.collegehumor.com/oembed.json?url=%s&maxwidth=550",
          # :pollyeverywhere => "http://www.polleverywhere.com/services/oembed?url=%s&format=json",
          # :opera           => "http://my.opera.com/service/oembed/?url=%s",
          :embedly         => "http://api.embed.ly/1/oembed?url=%w&maxwidth=550",
          :ifixit          => "http://www.ifixit.com/Embed?url=%s&format=json",
          :smugmug         => "http://api.smugmug.com/services/oembed/?url=%s&format=json",
          :slideshare      => "http://www.slideshare.net/api/oembed/2?url=%s&format=json&maxwidth=550",
          :wordpress       => "http://public-api.wordpress.com/oembed/1.0/?format=json&url=%s&maxwidth=550"
        }
        # ready the hash for matching
        provider_names = (providers.keys.each { |name| name.to_s }).join('|')
        # match possible providers to see if we have a provider suitable for embedding the current href/url 
        result = href.match provider_names
        if result and result[0]
          safe_href = CGI.escape(href)
          provider = result[0].to_sym
          oembed_url = providers[provider] % safe_href
          # unique figure id
          fig_id = rand(1000)
          # oembed 
          el = Element.new :oembed
          begin
            # get the oEmbed content
            result = JSON.parse(open(oembed_url).read)
            el.attr['provider_name'] = result['provider_name']
            case result['type']
            when "photo"
              title = result['title']
              el.attr['role'] = "img"
              img = Element.new(:img)
              img.attr['src'] = result['url']
              img.attr['alt'] = result['title']
              img.attr['width'] = result['width']
              img.attr['height'] = result['height']
              img.children.clear
              el.children << img
            when "video"
              title = result['title']
              el.attr['html'] = CGI.unescapeHTML(result['html'])
            when "rich"
              el.attr['html'] = CGI.unescapeHTML(result['html'])
            end
            
          if title
            # unique figure id
            el_id = rand(1000)
            el.attr['id'] = el_id
            cap = Element.new(:figCaption, title)
            cap.attr['id'] = el_id
            if el.attr['role'] === "img"
              link = Element.new(:a, result['author_name'])
              link.attr['href'] = result['author_url']
              cap.children << link
            end
            el.children << cap 
          end
          @tree.children << el
            
          rescue
            warning("Could not retrieve oEmbed information for URL #{oembed_url}")
          end
        else
          warning("No oEmbed provider found for URL #{href}")
        end
        
        
        
        # if el.type == :a
        #   el.attr['href'] = href
        # else
        #   el.attr['src'] = href
        #   el.attr['alt'] = alt_text
        #   el.children.clear
        # end
        # el.attr['title'] = title if title
        # @tree.children << el
      end

      OEMBED_BRACKET_STOP_RE = /(\])|!?\[/
      OEMBED_PAREN_STOP_RE = /(\()|(\))|\s(?=['"])/
      OEMBED_INLINE_ID_RE = /\s*?\[([^\]]+)?\]/
      OEMBED_INLINE_TITLE_RE = /\s*?(["'])(.+?)\1\s*?\)/
      OEMBED_START = /\?\[(?=[^^])/

      # Parse the oembed at the current scanner position. This method is used to parse normal oembeds as
      # well as image oembeds.
      def parse_oembed
        result = @src.scan(OEMBED_START)
        reset_pos = @src.pos
        oembed_type = :img

        el = Element.new(oembed_type)

        count = 1
        found = parse_spans(el, OEMBED_BRACKET_STOP_RE) do
          count = count + (@src[1] ? -1 : 1)
          count - el.children.select {|c| c.type == :img}.size == 0
        end
        if !found || (oembed_type == :a && el.children.empty?)
          @src.pos = reset_pos
          add_text(result)
          return
        end
        alt_text = extract_string(reset_pos...@src.pos, @src)
        @src.scan(OEMBED_BRACKET_STOP_RE)

        # reference style oembed or no oembed url
        if @src.scan(OEMBED_INLINE_ID_RE) || !@src.check(/\(/)
          oembed_id = normalize_oembed_id(@src[1] || alt_text)
          if @oembed_defs.has_key?(oembed_id)
            add_oembed(el, @oembed_defs[oembed_id].first, @oembed_defs[oembed_id].last, alt_text)
          else
            warning("No oembed definition for oembed ID '#{oembed_id}' found")
            @src.pos = reset_pos
            add_text(result)
          end
          return
        end

        # oembed url in parentheses
        if @src.scan(/\(<(.*?)>/)
          oembed_url = @src[1]
          if @src.scan(/\)/)
            add_oembed(el, oembed_url, nil, alt_text)
            return
          end
        else
          oembed_url = ''
          nr_of_brackets = 0
          while temp = @src.scan_until(OEMBED_PAREN_STOP_RE)
            oembed_url << temp
            if @src[2]
              nr_of_brackets -= 1
              break if nr_of_brackets == 0
            elsif @src[1]
              nr_of_brackets += 1
            else
              break
            end
          end
          oembed_url = oembed_url[1..-2]
          oembed_url.strip!

          if nr_of_brackets == 0
            add_oembed(el, oembed_url, nil, alt_text)
            return
          end
        end

        if @src.scan(OEMBED_INLINE_TITLE_RE)
          add_oembed(el, oembed_url, @src[2], alt_text)
        else
          @src.pos = reset_pos
          add_text(result)
        end
      end
      define_parser(:oembed, OEMBED_START, '\?\[')

    end
  end
end

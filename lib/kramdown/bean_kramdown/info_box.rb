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

require 'kramdown/parser/kramdown/blank_line'
require 'kramdown/parser/kramdown/extensions'
require 'kramdown/parser/kramdown/eob'

module Kramdown
  module Parser
    class BeanKramdown

      INFO_BOX_START = /^#{OPT_SPACE}% ?/

      # Parse the info box at the current location.
      def parse_info_box
        result = @src.scan(PARAGRAPH_MATCH)
        while !@src.match?(self.class::LAZY_END)
          result << @src.scan(PARAGRAPH_MATCH)
        end
        result.gsub!(INFO_BOX_START, '')

        el = new_block_el(:info_box)
        @tree.children << el
        parse_blocks(el, result)
        true
      end

      define_parser(:info_box, INFO_BOX_START)


    end
  end
end
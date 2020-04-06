module ReverseMarkdown
  module Converters
    class U < Base
      def convert(node, state = {})
        content = treat_children(node, state.merge(already_underline: true))
        if content.strip.empty? || state[:already_underline]
          content
        else
          "#{content[/^\s*/]}__#{content.strip}__#{content[/\s*$/]}"
        end
      end
    end

    register :u, U.new
  end
end

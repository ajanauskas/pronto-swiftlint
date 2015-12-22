module Pronto
  module Swiftlint
    class OutputParser
      def parse(output)
        result = {}

        output.lines.each do |line|
          hash = parse_line(line)
          if hash
            file_path = hash.delete(:file)
            result[file_path] ||= []
            result[file_path] << hash
          end
        end

        result
      end

      private

      def parse_line(line)
        line_parts = line.split(':')

        return if line_parts.size < 5

        file_path = line_parts[0]
        violation_line = line_parts[1].to_i
        column, level, violation = identify_line_parts(line_parts)
        message, rule = extract_message_and_rule(violation)

        {
          file: file_path,
          line: violation_line,
          column: column,
          level: level,
          message: message,
          rule: rule
        }
      rescue => e
        puts "pronto-swiftlint WARN: failed to parse line: #{line}; error: #{e}"
        nil
      end

      def identify_line_parts(parts)
        if parts[2].to_i != 0
          [parts[2].to_i, parts[3].strip.to_sym, parts[5..parts.size - 1].join]
        else
          [nil, parts[2].strip.to_sym, parts[4..parts.size - 1].join]
        end
      end

      def extract_message_and_rule(message)
        rule = message[/\(.*?\)/].gsub('(', '').gsub(')', '')
        message = message[1..message.size - rule.size - 5]
        [message, rule]
      end
    end
  end
end

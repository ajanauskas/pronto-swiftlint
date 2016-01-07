require 'json'

module Pronto
  module Swiftlint
    class OutputParser
      def parse(output)
        begin
          violations = JSON.parse(output)
        rescue => e
          puts "pronto-swiftlint ERROR: failed to parse output. Is formatter set to json? #{e}"
          return {}
        end

        result = {}
        violations.each do |violation|
          file = violation['file']
          result[file] ||= []
          result[file] << {
            file: violation['file'],
            line: violation['line'],
            column: violation['character'],
            level: parse_severity(violation['severity']),
            message: violation['reason'],
            rule: violation['rule_id']
          }
        end
        result
      end

      private

      def parse_severity(severity)
        if severity == 'Warning'
          :warning
        elsif severity == 'Error'
          :error
        else
          :info
        end
      end
    end
  end
end

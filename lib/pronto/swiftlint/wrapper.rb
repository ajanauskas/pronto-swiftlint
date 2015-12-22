require 'open3'
require_relative 'output_parser'

module Pronto
  module Swiftlint
    class Wrapper
      def lint
        stdout, stderr, _ = Open3.capture3(swiftlint_executable)
        puts "WARN: pronto-swiftlint: #{stderr}" if stderr && stderr.size > 0
        return {} if stdout.nil? || stdout == 0
        OutputParser.new.parse(stdout)
      end

      private

      def swiftlint_executable
        ENV['PRONTO_SWIFTLINT_PATH'] || 'swiftlint'
      end
    end
  end
end

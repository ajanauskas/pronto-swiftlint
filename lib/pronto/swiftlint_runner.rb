require 'pronto/swiftlint/wrapper'
require 'pronto'

module Pronto
  class SwiftlintRunner < Runner
    def run(patches, _)
    end

    private

    def swift_file?(path)
      %w(.swift).include?(File.extname(path))
    end
  end
end

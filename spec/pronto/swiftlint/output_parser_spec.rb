require 'spec_helper'
require 'pathname'
require 'pronto/swiftlint/output_parser'

RSpec.describe Pronto::Swiftlint::OutputParser do
  let(:parser) { described_class.new }

  describe '#parse' do
    subject { parser.parse(output) }

    let(:output) do
      File.read("#{Pathname.pwd}/spec/fixtures/swiftlint_output.txt")
    end

    it 'parses output' do
      expect(subject).to eq({
        '/Users/andrius/work/ios/TestApp/Views/MyView.swift' => [
          {
            line: 1,
            column: 7,
            level: :warning,
            message: 'Colons should be next to the identifier when specifying a type.',
            rule: 'colon'
          },
          {
            line: 43,
            column: nil,
            level: :warning,
            message: 'Lines should not have trailing whitespace.',
            rule: 'trailing_whitespace'
          }
        ]
      })
    end
  end
end

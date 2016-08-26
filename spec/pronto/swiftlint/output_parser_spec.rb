require 'spec_helper'

RSpec.describe Pronto::Swiftlint::OutputParser do
  let(:parser) { described_class.new }

  describe '#parse' do

    let(:output) do
      File.read("#{Pathname.pwd}/spec/fixtures/swiftlint_output.json")
    end

    subject { parser.parse(output) }

    it 'parses output' do
      expect(subject).to eq(
        '/Users/zw/Desktop/Test/Test.swift' => [
          {
            file: '/Users/zw/Desktop/Test/Test.swift',
            line: 4,
            column: 5,
            level: :warning,
            message: 'Colons should be next to the identifier when specifying a type.',
            rule: 'colon'
          },
          {
            file: '/Users/zw/Desktop/Test/Test.swift',
            line: 3,
            column: 32,
            level: :error,
            message: 'Force casts should be avoided.',
            rule: 'force_cast'
          }
        ]
      )
    end
  end
end

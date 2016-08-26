require 'spec_helper'

describe Pronto::SwiftlintRunner do
  let(:swiftlint) { Pronto::SwiftlintRunner.new(patches) }
  let(:patches) { nil }

  it 'has a version number' do
    expect(Pronto::Swiftlint::VERSION).not_to be nil
  end

  describe '#run' do
      subject { swiftlint.run }

      context 'patches are nil' do
        it { should == [] }
      end

      context 'no patches' do
        let(:patches) { [] }
        it { should == [] }
      end

      context 'patch with a smell' do
        include_context 'test repo'

        let(:patches) { repo.diff('master') }

        its(:count) { should == 2 }

        its(:'first.msg') do
          should ==
            'Colons should be next to the identifier when specifying a type.'
        end
      end
  end
end

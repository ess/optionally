require 'spec_helper'

class Dummy
  include Optionally::Required
end

describe Optionally::Required do
  let(:opthash) {{option1: true, option2: 'blah', option3: 3}}

  context 'when included' do
    it 'adds checking to the instance' do
      expect(Dummy.new).to respond_to(:check_required_options)
    end

    it 'adds checking to the class' do
      expect(Dummy).to respond_to(:check_required_options)
    end
  end

  describe '#check_required_options' do
    context 'when all required keys are present in the options' do
      it 'is true' do
        expect(Dummy.check_required_options(opthash, :option1)).
          to eql(true)

        expect(Dummy.check_required_options(opthash, :option1, :option2)).
          to eql(true)

        expect(
          Dummy.check_required_options(opthash, :option1, :option2, :option3)
        ).to eql(true)
      end
    end

    context 'when required keys are missing in the options' do
      it 'raises an error' do
        expect{Dummy.check_required_options(opthash, :missing)}.
          to raise_error(ArgumentError)
      end
    end
  end
end

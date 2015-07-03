require 'spec_helper'

describe LuhnMod16::CheckDigit do

  subject { LuhnMod16::CheckDigit.new(string).check_digit }

  context 'when the string is valid' do
    let(:string) { '0B012722900021AC35B2' }


    it 'should produce the correct check digit' do
      expect(subject).to eq 1
    end
  end
end

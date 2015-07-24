require 'spec_helper'

describe LuhnMod16::CheckDigit do

  subject { LuhnMod16::CheckDigit.new(string).check_digit }

  context 'Royal Mail documentation example' do
    let(:string) { '0B012722900021AC35B2' }

    it { is_expected.to eq '1' }
  end

  context 'Ambiguous case not covered by docs' do
    let(:string) { '0B012722900021AC35BD' }

    it { is_expected.to eq '8' }
  end
end

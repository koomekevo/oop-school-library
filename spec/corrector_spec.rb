require_relative '../corrector'

describe Corrector do
  context 'It should capitalize the first letter of given name' do
    corrector = Corrector.new
    it 'should capitalize the first letter' do
      expect(corrector.correct_name('evren')).to eq 'Evren'
      expect(corrector.correct_name('kevin')).to eq 'Kevin'
    end
  end
end

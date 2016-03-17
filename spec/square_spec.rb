require 'spec_helper'

describe 'Squares' do
  context 4 do
    it { should be_the_square_of 2 }
  end

  context 9 do
    it { should be_the_square_of 3 }
  end

  context 20 do
    it { should not_be_the_square_of 4 }
  end

  # another way
  context '49' do
    it do
      expect(49).to not_be_the_square_of 8
    end
  end

  context '49' do
    it do
      expect(49).to be_the_square_of 7
    end
  end

  # override the default message
  context '2025' do
    it 'is big but still the square of 45' do
      expect(2025).to be_the_square_of 45
    end
  end
end

# frozen_string_literal: true

require 'rspec'
require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add('')).to eq(0)
    end

    it 'returns the number for a single number' do
      expect(StringCalculator.add('1')).to eq(1)
    end

    it 'returns the sum of two numbers' do
      expect(StringCalculator.add('1,2')).to eq(3)
    end

    it 'returns the sum of multiple numbers' do
      expect(StringCalculator.add('1,5,1,10')).to eq(17)
    end

    it 'handles new lines between numbers' do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it 'handles different delimiters' do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it 'raises an exception for negative numbers' do
      expect { StringCalculator.add('1,-2,3') }.to raise_error('negative numbers not allowed -2')
    end

    it 'raises an exception for multiple negative numbers' do
      expect { StringCalculator.add('1,-2,-3') }.to raise_error('negative numbers not allowed -2, -3')
    end

    it 'ignores numbers greater than 1000' do
      expect(StringCalculator.add('2,1001')).to eq(2)
      expect(StringCalculator.add('1000,1001,2')).to eq(1002)
    end

    it 'handles different delimiters' do
      expect(StringCalculator.add("//[***]\n1***2***3")).to eq(6)
    end
  end
end

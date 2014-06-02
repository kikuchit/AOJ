require 'rubygems'
require 'rspec'
require_relative 'answer'

describe '#bsearch' do
  context '一致する値を検索' do
    it do
      arr = [1, 2, 3, 4, 5, 6, 7] # [1, 3, 5, 7, 9, 11, 13]
      target = 4
      result = bsearch(arr, target)
      expect(result).to eq(2)
    end

    it do
      arr = [10, 20, 30, 40] # [11, 22, 33, 44]
      target = 35
      result = bsearch(arr, target)
      expect(result).to eq(3)
    end

    it do
      arr = [1, 2, 3, 4, 5, 6, 7] # [1, 3, 5, 7, 9, 11, 13]
      target = 14
      result = bsearch(arr, target)
      expect(result).to eq(-1)
    end
  end
end
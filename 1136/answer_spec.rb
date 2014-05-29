require 'rubygems'
require 'rspec'
require_relative 'answer3'

describe '#get_direction' do
  context '右折の場合' do
    it do
      prev_prev_x = 0
      prev_prev_y = 0
      prev_x = 0
      prev_y = 2
      next_x = 2
      next_y = 2
      next_direction,prev_direction = get_direction(next_x, next_y, prev_x, prev_y, prev_prev_x, prev_prev_y)
      expect(next_direction).to eq Direction::TURN_RIGHT
      expect(prev_direction).to eq Direction::TURN_LEFT
    end
  end

  context '左折の場合' do
    it do
      prev_prev_x = 0
      prev_prev_y = 0
      prev_x = 0
      prev_y = 2
      next_x = -2
      next_y = 2
      next_direction,prev_direction = get_direction(next_x, next_y, prev_x, prev_y, prev_prev_x, prev_prev_y)
      expect(next_direction).to eq Direction::TURN_LEFT
      expect(prev_direction).to eq Direction::TURN_RIGHT
    end
  end
end
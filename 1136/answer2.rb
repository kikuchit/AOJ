module Direction
  UP = 0
  DOWN = 1
  LEFT = 2
  RIGHT = 3

  TURN_LEFT = 0
  TURN_RIGHT = 1
  TABLE = [
    [nil, nil, TURN_LEFT, TURN_RIGHT],
    [nil, nil, TURN_RIGHT, TURN_LEFT],
    [TURN_RIGHT, TURN_LEFT, nil, nil],
    [TURN_LEFT, TURN_RIGHT, nil, nil]
  ]
end

class Edge
  def initialize length
    @length = length
    @next_edge = nil
    @next_direction = nil
    @prev_edge = nil
    @prev_direction = nil
  end

  def eql? edge
    unless @length == edge.length
      return false
    end

    if @next_edge.nil? and edge.next_edge.nil?
      return true
    elsif @next_edge.nil? or edge.next_edge.nil?
      return false
    end

    unless @next_direction == edge.next_direction
      return false
    end

    return @next_edge.eql?(edge.next_edge)
  end

  def reverse_eql? edge
    unless @length == edge.length
      return false
    end

    if @next_edge.nil? and edge.prev_edge.nil?
      return true
    elsif @next_edge.nil? or edge.prev_edge.nil?
      return false
    end

    unless @next_direction == edge.prev_direction
      return false
    end

    return @next_edge.reverse_eql?(edge.prev_edge)
  end

  attr_accessor :length, :next_edge, :next_direction, :prev_edge, :prev_direction
end

def main
  loop do
    n = gets.chomp.to_i
    break if n == 0

    polygonal_lines = []
    (n+1).times do
      line = []
      m = gets.chomp.to_i
      prev_x,prev_y = gets.chomp.split(' ').map(&:to_i)

      prev_line_direction = nil
      prev_edge = nil
      (m-1).times do
        next_direction = nil
        prev_direction = nil

        x,y = gets.chomp.split(' ').map(&:to_i)

        length,line_direction = get_length_and_direction(prev_x, prev_y, x, y)
        edge = Edge.new(length)

        unless line.empty?
          next_direction,prev_direction = get_direction(prev_line_direction, line_direction)
          prev_edge.next_edge = edge
          prev_edge.next_direction = next_direction
          edge.prev_edge = prev_edge
          edge.prev_direction = prev_direction
        end
        line << edge

        prev_line_direction = line_direction
        prev_edge = edge
        prev_x = x
        prev_y = y
      end
      polygonal_lines << line
    end

    target = polygonal_lines.shift
    polygonal_lines.each_with_index do |p_line, i|
      puts i + 1 if target[0].eql?(p_line[0]) or target[0].reverse_eql?(p_line[-1])
    end
    puts '+++++'
  end
end

def get_direction prev_line_direction, next_line_direction
  next_direction = Direction::TABLE[prev_line_direction][next_line_direction]
  prev_direction = nil
  if next_direction == Direction::TURN_LEFT
    prev_direction = Direction::TURN_RIGHT
  else
    prev_direction = Direction::TURN_LEFT
  end
  [next_direction, prev_direction]
end

def get_length_and_direction prev_x, prev_y, next_x, next_y
  unless next_x == prev_x
    if (next_x <=> prev_x) > 0
      return [(next_x - prev_x).abs + 1, Direction::RIGHT]
    else
      return [(prev_x - next_x).abs + 1, Direction::LEFT]
    end
  else
    if (next_y <=> prev_y) > 0
      return [(next_y - prev_y).abs + 1, Direction::UP]
    else
      return [(prev_y - next_y).abs + 1, Direction::DOWN]
    end
  end
end

main
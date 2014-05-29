module Direction
  TURN_LEFT = 0
  TURN_RIGHT = 1
  BASE = TURN_RIGHT
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
    return false unless @length == edge.length
    return true if @next_edge.nil? and edge.next_edge.nil?
    return false if @next_edge.nil? or edge.next_edge.nil?
    return false unless @next_direction == edge.next_direction
    return @next_edge.eql?(edge.next_edge)
  end

  def reverse_eql? edge
    return false unless @length == edge.length
    return true if @next_edge.nil? and edge.prev_edge.nil?
    return false if @next_edge.nil? or edge.prev_edge.nil?
    return false unless @next_direction == edge.prev_direction
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
      prev_prev_x = nil
      prev_prev_y = nil
      prev_edge = nil
      (m-1).times do
        x,y = gets.chomp.split(' ').map(&:to_i)

        length = get_length(prev_x, prev_y, x, y)
        edge = Edge.new(length)

        unless line.empty?
          prev_edge.next_direction = get_direction(x, y, prev_x, prev_y, prev_prev_x, prev_prev_y)
          edge.prev_direction = prev_edge.next_direction ^ Direction::BASE
          prev_edge.next_edge = edge
          edge.prev_edge = prev_edge
        end
        line << edge

        prev_edge = edge
        prev_prev_x = prev_x
        prev_prev_y = prev_y
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

def get_direction x, y, prev_x, prev_y, prev_prev_x, prev_prev_y
  case
  when x > prev_x
    case
    when prev_y > prev_prev_y; Direction::TURN_RIGHT
    when prev_y < prev_prev_y; Direction::TURN_LEFT
    end
  when x < prev_x
    case
    when prev_y > prev_prev_y; Direction::TURN_LEFT
    when prev_y < prev_prev_y; Direction::TURN_RIGHT
    end
  when y > prev_y
    case
    when prev_x > prev_prev_x; Direction::TURN_LEFT
    when prev_x < prev_prev_x; Direction::TURN_RIGHT
    end
  when y < prev_y
    case
    when prev_x > prev_prev_x; Direction::TURN_RIGHT
    when prev_x < prev_prev_x; Direction::TURN_LEFT
    end
  end
end

def get_length prev_x, prev_y, next_x, next_y
  unless next_x == prev_x
    if (next_x <=> prev_x) > 0
      return (next_x - prev_x).abs + 1
    else
      return (prev_x - next_x).abs + 1
    end
  else
    if (next_y <=> prev_y) > 0
      return (next_y - prev_y).abs + 1
    else
      return (prev_y - next_y).abs + 1
    end
  end
end

main
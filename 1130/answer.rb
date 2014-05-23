re 'set'
 
class Number
  def initialize num
    @num = num
  end
 
  def == num
    @num == num
  end
 
  attr_reader :num
end
 
def main
  loop do
    w,h = gets.chomp.split(' ').map(&:to_i)
    break if (w|h) == 0
    puts solve(w, h)
  end
end
 
def solve w, h
  grid = Array.new(h+1).map{Array.new(w+1, 0)}
  sets = []
  start_h = 0
  start_w = 0
  h.times do |i|
    line = gets.chomp
    line.each_char.with_index do |c, j|
      grid[i+1][j+1] = case c
      when '.' then Number.new(1)
      when '@'
        start_h = i + 1
        start_w = j + 1
        Number.new(1)
      when '#' then Number.new(0)
      end
 
      next if grid[i+1][j+1] == 0
 
      if grid[i+1][j] == 0 and grid[i][j+1] == 0
        sets << Set.new([grid[i+1][j+1]])
        next
      end
 
      left_set = nil
      top_set = nil
      sets.each do |set|
        if set.include?(grid[i+1][j])
          set << grid[i+1][j+1]
          left_set = set
        end
 
        if set.include?(grid[i][j+1])
          set << grid[i+1][j+1]
          top_set = set
        end
      end
 
      if left_set.nil? or top_set.nil?
        next
      end
 
      union_set = nil
      unless left_set.equal?(top_set)
        union_set = left_set + top_set
        sets.delete(left_set)
        sets.delete(top_set)
        sets << union_set
      end
    end
  end
 
  result = 0
  sets.each do |set|
    if set.include?(grid[start_h][start_w])
      result = set.size
      break
    end
  end
  result
end
 
main

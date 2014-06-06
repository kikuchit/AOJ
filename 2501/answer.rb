def main
  n = gets.chomp.to_i
  a,b = gets.chomp.split(' ').map(&:to_i)
  c,d = gets.chomp.split(' ').map(&:to_i)

  puts (1..n).map {|w|
    dist(*pos(w, a), *pos(w, b)) + dist(*pos(w, c), *pos(w, d))
  }.min
end

def dist x1, y1, x2, y2
  (x1 - x2).abs + (y1 - y2).abs
end

def pos width, order
  [(order - 1) / width, (order - 1) % width]
end

main
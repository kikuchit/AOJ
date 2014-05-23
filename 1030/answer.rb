require 'set'
 
def main
  loop do
    n,h = gets.chomp.split(' ').map(&:to_i)
    break if (n|h) == 0
    get_non_hole_cubes_num(n, h)
  end
end
 
def get_non_hole_cubes_num n, h
  hole_cubes = Set.new
 
  h.times do
    c,a,b = gets.chomp.split(' ')
    case c
    when 'xy'
      x = a.to_i
      y = b.to_i
      1.upto(n) do |idx|
        hole_cubes << "#{x} #{y} #{idx}"
      end
    when 'xz'
      x = a.to_i
      z = b.to_i
      1.upto(n) do |idx|
        hole_cubes << "#{x} #{idx} #{z}"
      end
    when 'yz'
      y = a.to_i
      z = b.to_i
      1.upto(n) do |idx|
        hole_cubes << "#{idx} #{y} #{z}"
      end
    end
  end
 
  puts n * n * n - hole_cubes.size
end
 
main

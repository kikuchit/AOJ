def main
  n = gets.chomp.to_i
  n.times do
    mcxi1,mcxi2 = gets.chomp.split(' ').map{ |x| to_integer(x)}
    puts to_mcxi(mcxi1 + mcxi2)
  end
end

def to_integer mcxi
  integer = 0
  num = 1
  0.upto(mcxi.size - 1) do |idx|
    if mcxi[idx] =~ /[2-9]/
      num = mcxi[idx].to_i
      next
    end

    integer += num * begin
      case mcxi[idx]
      when 'm'; 1000
      when 'c'; 100
      when 'x'; 10
      when 'i'; 1
      end
    end
    num = 1
  end
  integer
end

def to_mcxi integer
  mcxi = ''
  m = integer / 1000
  unless m == 0
    mcxi << m.to_s unless m == 1
    mcxi << 'm'
  end

  c = integer % 1000 / 100
  unless c == 0
    mcxi << c.to_s unless c == 1
    mcxi << 'c'
  end

  x = integer % 100 / 10
  unless x == 0
    mcxi << x.to_s unless x == 1
    mcxi << 'x'
  end

  i = integer % 10 / 1
  unless i == 0
    mcxi << i.to_s unless i == 1
    mcxi << 'i'
  end

  mcxi
end

main
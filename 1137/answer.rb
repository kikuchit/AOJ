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
  mcxi.each_char do |c|
    if c =~ /[2-9]/
      num = c.to_i
      next
    end

    integer += num * get_divisor(c)
    num = 1
  end
  integer
end

def to_mcxi integer
  mcxi = ''
  mcxi << get_mcxi(integer, 1000)
  mcxi << get_mcxi(integer % 1000, 100)
  mcxi << get_mcxi(integer % 100, 10)
  mcxi << get_mcxi(integer % 10, 1)
  mcxi
end

def get_mcxi integer, divisor
  mcxi = ''
  i = integer / divisor
  unless i == 0
    mcxi << i.to_s unless i == 1
    mcxi << get_unit(divisor)
  end
  mcxi
end

def get_unit integer
  case integer
  when 1000; 'm'
  when 100; 'c'
  when 10; 'x'
  when 1; 'i'
  end
end

def get_divisor unit
  case unit
  when 'm'; 1000
  when 'c'; 100
  when 'x'; 10
  when 'i'; 1
  end
end

main
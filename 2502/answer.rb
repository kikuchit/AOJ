class Phrase
  def initialize s, l, p
    @s = s
    @l = l
    @p = p
  end
  attr_reader :s, :l, :p
end

def main
  n = gets.chomp.to_i
  phrases = []
  min = 393;
  n.times do
    s,l,p = gets.chomp.split(' ').map(&:to_i)
    min = s if min > s
    phrases << Phrase.new(s, l, p)
  end

  results = []
  melodys = []
  m = gets.chomp.to_i
  m.times do
    w = gets.chomp.to_i
    if w < min
      puts '-1'
      return 0;
    end
    melodys << w
  end

  max_long_melody = melodys.max
  p_arr = Array.new(max_long_melody + 1, 0)
  d_arr = Array.new(max_long_melody + 1, 0)
  phrases.each do |phrase|
    phrase.s.upto(max_long_melody) do |i|
      pp = p_arr[i-phrase.s] + phrase.p
      if pp > p_arr[i]
        p_arr[i] = pp
        d_arr[i] = d_arr[i-phrase.s] + phrase.l - phrase.s
      end
    end
  end

  melodys.each do |w|
    max_index = p_arr[0..w].index(p_arr[0..w].max)
    if w - max_index > d_arr[max_index]
      puts '-1'
      return 0;
    end

    results << p_arr[max_index]
  end

  results.each do |result|
    puts result
  end
end

main
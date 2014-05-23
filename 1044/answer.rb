def main
  loop do
    str,pattern = gets.chomp.split(' ')
    break if pattern.eql?('X')
 
    case pattern
    when 'U'
      puts conversion_to_upper_camel_case(str)
    when 'L'
      puts conversion_to_lower_camel_case(str)
    when 'D'
      puts conversion_to_snake_case(str)
    end
  end
end
 
def split_word str
  words = []
  word = ''
  str.length.times do |i|
    if str[i].match(/_/)
      words << word
      word = ''
    elsif str[i].match(/[A-Z]/)
      words << word unless i == 0
      word = str[i]
    else
      word << str[i]
    end
  end
  words << word
  words
end
 
def conversion_to_upper_camel_case str
  words = split_word(str)
  words.map{|word|word.capitalize}.join
end
 
def conversion_to_lower_camel_case str
  conversion_word = ''
  words = split_word(str)
  words.each_with_index do |word, i|
    if i == 0
      conversion_word << word.downcase
    else
      conversion_word << word.capitalize
    end
  end
  conversion_word
end
 
def conversion_to_snake_case str
  words = split_word(str)
  words.each.map{|word|word.downcase}.join('_')
end
 
main

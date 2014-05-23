def main
  answers = []
  loop do
    n = gets.chomp.to_i
    break if n == 0
    src_str = gets.chomp
    dest_str = src_str
 
    n.times do
      dest_str = conversion(dest_str)
    end
 
    answers << dest_str
  end
 
  answers.each {|answer|puts answer}
end
 
def conversion src_str
  str_ary = get_same_char_string_ary(src_str)
  make_str(str_ary)
end
 
def get_same_char_string_ary src_str
  scan_result = []
  base_str = src_str
  loop do
    scan_str = get_same_char_string(base_str)
    break if scan_str.empty?
    base_str = base_str[scan_str.length..-1]
    scan_result << scan_str
  end
  scan_result
end
 
def get_same_char_string src_str
  first_char = src_str[0]
  same_char_string = ''
  src_str.each_char do |c|
    break if c != first_char
    same_char_string << c
  end
  same_char_string
end
 
def make_str str_ary
  dest_str = ''
  str_ary.each do |str|
    dest_str << str.length.to_s
    dest_str << str.chr
  end
  dest_str
end
 
main

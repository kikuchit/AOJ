class ConversionTable
  def initialize
    @data = {}
  end
 
  def set_data src_char, dest_char
    @data[src_char] = dest_char
  end
 
  def conversion char
    if @data[char].nil?
      return char
    end
 
    @data[char]
  end
end
 
def make_conversion_table data_num
  conversion_table = ConversionTable.new
 
  data_num.times do
    src_char,dest_char = gets.chomp.split(' ')
    conversion_table.set_data(src_char, dest_char)
  end
 
  conversion_table
end
 
def answer_string conversion_table, str_length
  answer_str = ''
 
  str_length.times do
    input_char = gets.chomp
    answer_str << conversion_table.conversion(input_char)
  end
 
  answer_str
end
 
answers = []
 
loop do
  data_num = gets.chomp.to_i
  break if data_num == 0
  table = make_conversion_table(data_num)
 
  str_length = gets.chomp.to_i
  answers << answer_string(table, str_length)
end
 
answers.each do |str|
  puts str
end

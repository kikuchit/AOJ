def parse str
  answer = ''
  ary = str.split(/ /)
  ary.each do |word|
    answer << word.length.to_s
  end
  answer.to_i
end
 
answers = []
 
loop do
  str = gets.chomp
  break if str.eql?('END OF INPUT')
  answers << parse(str)
end
 
answers.each{|answer|puts answer}

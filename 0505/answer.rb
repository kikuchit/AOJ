class Destination
  def initialize name
    @name = name
    @result = 0
  end
 
  attr_accessor :result
  attr_reader :name
end
 
answers = []
 
loop do
  student_num,destination_num = gets.chomp.split(' ').map{|x|x.to_i}
  break if student_num == 0 && destination_num == 0
 
  destinations = Array.new(destination_num) {|i| Destination.new(i+1)}
 
  student_num.times do
    questionnaire_list = gets.chomp.split(' ').map{|x|x.to_i}
 
    destination_num.times do |idx|
      destinations[idx].result += questionnaire_list[idx]
    end
  end
 
  i = 0
  destinations.sort_by!{|x| [x.result * -1, i += 1]}
 
  answers << destinations.map{|destination|destination.name}.join(' ')
end
 
answers.each{|a|puts a}

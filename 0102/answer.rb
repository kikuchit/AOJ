loop do
  n = gets.chomp.to_i
  break if n == 0
 
  graph = []
  total = Array.new(n+1, 0)
  n.times do
    line = gets.chomp.split(' ').map(&:to_i)
 
    line_sum = 0
    line.each{|cell| line_sum += cell}
 
    line << line_sum
    graph << line
 
    total = total.zip(line).map{|x, y| x + y}
  end
 
  graph << total
  graph.each do |line|
    puts line.map{|cell|"%5d" % cell}.join
  end
end

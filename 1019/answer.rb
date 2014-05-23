loop do
  n,k = gets.chomp.split(' ').map(&:to_i)
  break if (n|k) == 0
  stocks = gets.chomp.split(' ').map(&:to_i)
  family_total = Array.new(k, 0)
  n.times do
    member = gets.chomp.split(' ').map(&:to_i)
    family_total = member.zip(family_total).map{|x, y|x + y}
  end
 
  result = true
  stocks.zip(family_total).each do |stock, total|
    if stock < total
      result = false
      break
    end
  end
  puts result ? 'Yes' : 'No'
end

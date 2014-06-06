$MAX_DAY = 3_652_425

def main
  n,q = gets.chomp.split(' ').map(&:to_i)
  days = Array.new($MAX_DAY + 1, 0)
  consum = Array.new($MAX_DAY + 1, 0)
  final_index = 0
  no_consum_index = 0

  n.times do
    w,t,x = gets.chomp.split(' ').map(&:to_i)
    recover_day = -1
    if consum[final_index] + final_index >= w
      recover_day = final_index
    else
      (final_index+1).upto($MAX_DAY) do |i|
        consum[i] = days[i] + consum[i-1]
        if consum[i] + i >= w
          final_index = i
          recover_day = i
          break
        end
      end
    end

    if recover_day == -1
      puts 'Many years later'
      next
    end

    puts recover_day

    index = 0
    x.times do |i|
      index = recover_day + 1 + i
      break if index > $MAX_DAY
      days[index] += (i+1) ** t
    end
    no_consum_index = [no_consum_index, (index < $MAX_DAY ? index : $MAX_DAY)].max
  end

  (final_index+1).upto(no_consum_index) do |i|
    consum[i] = days[i] + consum[i-1]
  end
  final_index = no_consum_index

  q.times do
    target = gets.chomp.to_i
    if target <= final_index
      puts target + consum[target]
    else
      puts target + consum[final_index]
    end
  end
end

main
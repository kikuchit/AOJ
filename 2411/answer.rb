$MAX_DAY = 3_652_425

def bsearch arr, first, last, consum, value
  si = first
  ei = last
  target = -1
  last_value = 0

  loop do
    break if si > ei

    target = (ei + si) / 2
    last_value = (consum < target ? arr[consum] : arr[target]) + target
    if last_value > value
      ei = target - 1
    elsif last_value < value
      si = target + 1
    else
      break
    end
  end

  if last_value < value or target == -1
    return -1
  end

  target
end

def main
  n,q = gets.chomp.split(' ').map(&:to_i)
  days = Array.new($MAX_DAY + 1, 0)
  consum = 0
  n.times do
    w,t,x = gets.chomp.split(' ').map(&:to_i)
    recover_day = bsearch(days, 0, days.size - 1, consum, w)
    if recover_day == -1
      puts 'Many years later'
      next
    end

    puts recover_day

    if consum < recover_day
      consum.upto(recover_day) do |i|
        days[i] = days[consum]
      end
      consum = recover_day
    end

    recover_value = 0
    prev = 0
    x.times do |j|
      break if (recover_day + 1 + j) > $MAX_DAY
      index = recover_day + 1 + j
      recover_value = begin
        case t
        when 0; 1
        when 1; j+1
        when 2; (j+1) ** 2
        end
      end
      if days[index] == 0
        days[index] = recover_value + days[index-1]
      else
        days[index] += prev + recover_value
      end
      prev += recover_value
      consum = index if index > consum
    end
  end

  q.times do
    target = gets.chomp.to_i
    if target <= consum
      puts target + days[target]
    else
      puts target + days[consum]
    end
  end
end

main

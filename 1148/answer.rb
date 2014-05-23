class UseTime
  def initialize login
    @login = login
    @logout = -1
    @pc_num = 1
  end
  attr_accessor :login, :logout, :pc_num
end
 
def main
  loop do
    pc_num,student_num = gets.chomp.split(' ').map(&:to_i)
    break if (pc_num|student_num) == 0
 
    log_num = gets.chomp.to_i
 
    log_list = Array.new(student_num + 1).map{Array.new()}
    log_num.times do
      time,pc,student,action = gets.chomp.split(' ').map(&:to_i)
      case action
      when 1
        if log_list[student].size == 0 \
          or log_list[student][-1].logout != -1
          log_list[student] << UseTime.new(time)
          next
        end
        log_list[student][-1].pc_num += 1
      when 0
        log_list[student][-1].pc_num -= 1
        if log_list[student][-1].pc_num == 0
          log_list[student][-1].logout = time
        end
      end
    end
 
    question_num = gets.chomp.to_i
    question_num.times do
      start_time,end_time,student = gets.chomp.split(' ').map(&:to_i)
 
      total = 0
      log_list[student].each do |record|
        if record.logout < start_time
          next
        end
 
        if record.login > end_time
          break
        end
 
        s = (record.login < start_time) ? start_time : record.login
        e = (record.logout > end_time) ? end_time : record.logout
        total += e - s
      end
      puts total
    end
  end
end
 
main

class Team
  def initialize tid, problem_num
    @tid = tid
    @correct_num = 0
    @penalty = 0
    @problems = {}
    1.upto(problem_num) do |pid|
      @problems[pid] = 0
    end
  end
 
  def correct pid, time
    @correct_num += 1
    @penalty += @problems[pid] * 1200 + time
  end
 
  def wrong pid
    if @problems[pid].nil?
      @problems[pid] = 1
    else
      @problems[pid] += 1
    end
  end
 
  def <=> team
    return 1 if @correct_num > team.correct_num
    return -1 if @correct_num < team.correct_num
    return 1 if @penalty < team.penalty
    return -1 if @penalty > team.penalty
    return 1 if @tid < team.tid
    return -1 if @tid > team.tid
    return 0
  end
 
  attr_reader :tid, :correct_num, :penalty
end
 
def main
  loop do
    t,p,r = gets.chomp.split(' ').map(&:to_i)
    break if (t|p|r) == 0
 
    teams = make_teams(t, p)
    log_analyze(teams, r)
    print_ranking(teams)
  end
end
 
def make_teams t, p
  teams = []
  t.times do |i|
    teams << Team.new(i+1, p)
  end
  teams
end
 
def log_analyze teams, r
  r.times do
    tid,pid,time,message = gets.chomp.split(' ')
    if message == 'CORRECT'
      teams[tid.to_i-1].correct(pid.to_i, time.to_i)
    else
      teams[tid.to_i-1].wrong(pid.to_i)
    end
  end
end
 
def print_ranking teams
  teams.sort{|a, b| b <=> a}.each do |team|
    puts "#{team.tid} #{team.correct_num} #{team.penalty}"
  end
end
 
main

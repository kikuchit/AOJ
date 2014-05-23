ass Dice
  def initialize
    @top = 1
    @under = 6
    @north = 5
    @south = 2
    @east = 3
    @west = 4
  end
 
  def north
    tmp = @top
    @top = @south
    @south = @under
    @under = @north
    @north = tmp
    @top
  end
 
  def east
    tmp = @top
    @top = @west
    @west = @under
    @under = @east
    @east = tmp
    @top
  end
 
  def west
    tmp = @top
    @top = @east
    @east = @under
    @under = @west
    @west = tmp
    @top
  end
 
  def south
    tmp = @top
    @top = @north
    @north = @under
    @under = @south
    @south = tmp
    @top
  end
 
  def right
    tmp = @south
    @south = @east
    @east = @north
    @north = @west
    @west = tmp
    @top
  end
 
  def left
    tmp = @south
    @south = @west
    @west = @north
    @north = @east
    @east = tmp
    @top
  end
end
 
def operation op_num
  total = 1
  dice = Dice.new
  op_num.times do
    op_str = gets.chomp.downcase
    total += eval("dice.#{op_str}.to_i")
  end
  total
end
 
answers = []
loop do
  op_num = gets.chomp.to_i
  break if op_num == 0
  answers << operation(op_num)
end
 
answers.each {|str|puts str}

class Work
  def initialize
    @cost = 0
    @prev_node = nil
    @next_node = nil
  end
  attr_accessor :cost, :prev_node, :next_node
end

class Node
  def initialize
    @max_day = 0
    @prev_works = []
    @next_works = []
  end
  attr_accessor :max_day, :prev_works, :next_works
end

def main
  n,m = gets.chomp.split(' ').map(&:to_i)
  nodes = Array.new(n).map{Node.new}
  works = Array.new(m).map{Work.new}

  m.times do |i|
    a,b,c = gets.chomp.split(' ').map(&:to_i)
    works[i].prev_node = nodes[a]
    works[i].next_node = nodes[b]
    works[i].cost = c
    nodes[a].next_works << works[i]
    nodes[b].prev_works << works[i]
  end

  update_max_day(nodes[0])
  puts nodes[-1].max_day
end

def update_max_day node
  return if node.next_works.size == 0
  node.next_works.each do |work|
    update_next_node(work)
  end

  node.next_works.each do |work|
    update_max_day(work.next_node)
  end
end

def update_next_node work
  if work.prev_node.max_day + work.cost > work.next_node.max_day or work.next_node.max_day == 0
    work.next_node.max_day = work.prev_node.max_day + work.cost
  end
end

main
#!/usr/bin/env ruby
 
def main
  loop do
    n,r = gets.chomp.split(' ').map(&:to_i)
    break if (n|r) == 0
    puts solve(n, r)
  end
end
 
def solve n, r
  cards = make_cards(n)
 
  r.times do
    p,c = gets.chomp.split(' ').map(&:to_i)
    cards = cut(cards, p, c)
  end
 
  cards.first
end
 
def make_cards n
  cards = []
  n.downto(1) do |i|
    cards << i
  end
  cards
end
 
def cut cards, p, c
  result_cards = cards.dup
 
  0.upto(c-1) do |i|
    result_cards[i] = cards[p-1+i]
  end
 
  0.upto(p-2) do |i|
    result_cards[c+i] = cards[i]
  end
 
  result_cards
end
 
main

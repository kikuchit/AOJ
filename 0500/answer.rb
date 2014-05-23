class Game
  def initialize
    @card_num = 0
    @a_cards = []
    @b_cards = []
    @a_total = 0
    @b_total = 0
  end
 
  def input card_num
    @card_num = card_num
    card_num.times do
      a,b = gets.chomp.split(' ').map{|x|x.to_i}
      @a_cards << a
      @b_cards << b
    end
  end
 
  def exec
    @card_num.times do |idx|
      if @a_cards[idx] > @b_cards[idx]
        @a_total = @a_total + @a_cards[idx] + @b_cards[idx]
      elsif @a_cards[idx] < @b_cards[idx]
        @b_total = @b_total + @a_cards[idx] + @b_cards[idx]
      else
        @a_total += @a_cards[idx]
        @b_total += @b_cards[idx]
      end
    end
  end
 
  def print
    puts "#{@a_total} #{@b_total}"
  end
end
 
class AllGame
  def initialize
    @games = []
  end
 
  def input
    loop do
      card_num = gets.chomp.to_i
      break if card_num == 0
      game = Game.new
      game.input card_num
      @games << game
    end
  end
 
  def exec
    @games.each do |game|
      game.exec
    end
  end
 
  def print
    @games.each do |game|
      game.print
    end
  end
end
 
all_game = AllGame.new
all_game.input
all_game.exec
all_game.print

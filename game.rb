require './player.rb'

class Game

  def initialize(player1, player2)
    puts "Player 1, enter your name."
    @player1 = Player.new(gets.chomp)
    puts "Player 2, enter your name."
    @player2 = Player.new(gets.chomp)
  end

end

game = Game.new(@player1, @player2)
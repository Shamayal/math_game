
class Game

  attr_accessor :current_player, :num1, :num2, :sum, :answer

  # get names of the players
  def initialize
    puts "Player 1, enter your name."
    @player1 = Player.new(gets.chomp)
    puts "Player 2, enter your name."
    @player2 = Player.new(gets.chomp)
    @current_player = @player1
  end

  # start each round
  def start_game
    while @player1.lives != 0 && @player2.lives != 0
      puts "----- NEW TURN -----"
      generate_question
      if @answer == @sum
        puts "#{@current_player.name}: ✅ YES! You are correct."
        @current_player.update_score
        puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"

        switch_player
      else
        puts "#{@current_player.name}: ❌ Seriously? No!"
        @current_player.lose_life
        puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"

        switch_player
      end
    end

    declare_winner
    puts "----- GAME OVER -----"
    puts "Thanks for playing 😁, good bye!"

  end

  def generate_question
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @sum = self.num1 + self.num2
    puts "#{@current_player.name}: What does #{@num1} plus #{@num2} equal?"
    @answer = gets.chomp.to_i
  end

  def switch_player
    @current_player == @player1 ? (@current_player = @player2) : (@current_player = @player1)
  end

  def declare_winner 
    if @player1.lives == 0
      puts "#{@player2.name} wins with a score of #{@player2.lives}/3 and a total of #{@player2.score} correct answers!"
    else 
      puts "#{@player1.name} wins with a score of #{@player1.lives}/3 and a total of #{@player1.score} correct answers!"
    end
  end
end

class Game
  require_relative 'player'
  require_relative 'board'
  attr_accessor :player, :board
  def initialize
    @board = Board.new
    @board.generate_code
  end
  def add_player
    @player = Player.new("Human")
  end
  def start_game
    puts "Welcome to Mastermind"
    puts "Try to guess the secret code, it has 4 numbers out of 6"
    puts "You have 12 tries"
    t = 1
    while @player.turns > 0
      puts "\nTry ##{t}"
      t += 1
      @player.take_guess
      if @board.winner?(@player.guess)
        puts "CONGRATS!!! YOU WIN THE GAME!"
        puts "The code was #{@board.code}"
        break
      else
        @player.turns -= 1
        @board.generate_clues(@player.guess, @board.code)
        @board.show_clues
      end
    end
    if @player.turns == 0
      puts "OW YOU LOSE"
      puts "The code was #{@board.code}"
    end
  end
end

g = Game.new
g.add_player
g.start_game

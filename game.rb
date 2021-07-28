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
    while @player.turns > 0
      puts "Turn ##{@player.turns}"
      @player.take_guess
      if @board.winner?(@player.guess)
        puts "CONGRATS!!! YOU WIN THE GAME!"
        puts "The code was #{@board.code}"
        break
      else
        @player.turns -= 1
        @board.generate_clues(@player.guess)
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
p g.board.code
g.start_game

class Board
  attr_accessor :code, :clues, :colors, :player
  def initialize
    @colors = [1,2,3,4,5,6]
    @code = []
    @clues = []
  end
  def generate_code
    4.times do
      @code << @colors.sample
    end
  end
  def winner?(guess)
    return @code == guess ? true : false
  end
  def generate_clues(guess)
    i = 0
    j = 0
    @clues = []
    while i < 4
      while j < 4
        if @code[i] == guess[j]
          if i == j
            @clues << 1
          else
            @clues << 0
          end
        end
        j += 1
      end
      i += 1
      j = 0
    end
  end
  def show_clues
    puts "Clues:"
    p @clues
  end
end

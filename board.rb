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
  def generate_clues(guess, code)
    i = 3
    @clues = []
    guess_aux = guess.take(4)
    code_aux = @code.take(4)
    4.times do
      if guess_aux[i] == code_aux[i]
        @clues << 1
        code_aux[i] = nil
      end
      i -= 1
    end
    until guess_aux.empty?
      g = guess_aux.pop
      if code_aux.include?(g)
        ic = code_aux.index(g)
        @clues << 0
        code_aux[ic] = nil
      end
    end
  end
  def find_zeros(guess, code)
    0.upto(3) do |i|
      0.upto(3) do |j|
        if guess[i] == code[i]
          if i != j
            @clues << 0
            break
          end
        end
      end
    end
    @clues
  end
  def show_clues
    puts "Clues:"
    p @clues
  end
end

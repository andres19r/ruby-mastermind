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
    i = 3
    @clues = []
    code_aux = @code.take(4)
    until guess.empty?
      g = guess.pop
      if code_aux.include?(g)
        ic = code_aux.index(g)
        if i == ic
          @clues << 1
        else
          @clues << 0
        end
        code_aux.delete_at(ic)
      end
      puts "aux #{code_aux}"
      i -= 1
    end
    @clues.sort.reverse
  end
  def show_clues
    puts "Clues:"
    p @clues
  end
end

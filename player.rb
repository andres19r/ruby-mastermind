class Player
  attr_accessor :id, :turns, :guess
  def initialize(id)
    @id = id
    @turns = 12
  end
  def take_guess
    print "=> "
    @guess = gets.chomp.split("").map{ |el| el.to_i }
  end
end

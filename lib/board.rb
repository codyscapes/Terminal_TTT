# require '.lib/tic_tac'
class Board

  attr_reader :spaces, :x_spaces, :o_spaces, :s

  def initialize
    @x_spaces =[]
    @o_spaces =[]
    @spaces = []
    9.times do |n|
      s = Space.new(n)
      @spaces << s
    end
  end

  def space_count
    @spaces.length
  end




end

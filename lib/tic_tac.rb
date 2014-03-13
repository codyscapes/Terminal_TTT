require './lib/space'
require './lib/player'
require './lib/board'

class Game

  attr_reader :board, :player_1, :player_2, :turn_count, :turn, :win
  attr_accessor :interfacearray

  def initialize(name1,name2)
    @interfacearray =[0,1,2,3,4,5,6,7,8]
    @board = Board.new
    @turn_count =1
    @player_to_move = 'x'
    @player_1 = Player.new(name1)
    @player_2 = Player.new(name2)
  end

  def turn
    @turn_count +=1
    if @turn_count.even?
     @player_to_move = 'o'
    else
      @player_to_move ='x'
    end
  end

  def player_to_move
    @player_to_move
  end

  def mark_space(space_chosen)
     if @player_to_move == 'x'
      self.board.spaces.each do |space|
        if space.name == space_chosen
          self.board.x_spaces << space
          self.board.spaces.delete(space)
          @interfacearray[space_chosen] = @player_to_move
          self.turn()
        end
      end
    else
      self.board.spaces.each do |space|
        if space.name == space_chosen
          self.board.o_spaces << space
          self.board.spaces.delete(space)
          @interfacearray[space_chosen] = @player_to_move
          self.turn()
        end
      end
    end
  end

def win
  win_condtions ={
    'con1' => [0,1,2],
    'con2' => [0,3,6],
    'con3' => [0,4,8],
    'con4' => [3,4,5],
    'con5' => [6,7,8],
    'con6' => [1,4,7],
    'con7' => [2,5,8],
    'con8' => [2,4,6]
  }
  check_array = []

  if @player_to_move == 'x'
    self.board.x_spaces.each do |space|
      check_array << space.name
    end
  else
    self.board.o_spaces.each do |space|
      check_array << space.name
    end
  end
  winner = 0
  win_condtions.each do |key,value|
   potential_win = value & check_array
      if potential_win.length == 3
         winner = @player_to_move
      elsif self.board.spaces.length < 1 && winner == 0
        winner ="MEOW"
      end
  end
  return winner
  end

end

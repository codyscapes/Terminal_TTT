require 'rspec'
require 'tic_tac'
require 'board'
require 'player'
require 'space'



describe Game do
  before do
    Player.reset
  end
  it 'should be an instance of game' do
    g = Game.new('Cody', 'Dan')
    g.should be_an_instance_of Game
  end
  it 'should be intialized with a board which is an instance of board' do
    g = Game.new('Cody', 'Dan')
    g.board.should be_an_instance_of Board
  end
   it 'have two players both of which are instances of Player' do
    g = Game.new('Cody', 'Dan')
    g.player_1.should be_an_instance_of Player
    g.player_2.should be_an_instance_of Player
  end
   it 'should have the ability to advance the turn_count and change the turn' do
    g =Game.new('dan', 'Cody')
    g.player_1.name.should eq 'dan'
    g.player_1.side.should eq 'x'
    g.player_2.side.should eq 'o'
    g.turn()
    g.turn_count.should eq 2
    g.player_to_move.should eq 'o'
    g.turn()
    g.turn_count.should eq 3
    g.player_to_move.should eq 'x'
  end
  it 'should have the ability to check a space with the players side' do
    g =Game.new('dan', 'Cody')
    g.player_1.name.should eq 'dan'
    g.player_1.side.should eq 'x'
    g.player_2.side.should eq 'o'
    g.turn_count.should eq 1
    g.turn()
    g.player_to_move.should eq 'o'
    g.mark_space(2)
    g.board.o_spaces[0].name.should eq 2
    g.board.x_spaces.should eq []
  end
  it 'should know if the player has won the game' do
    g =Game.new('dan', 'Cody')
    g.player_1.name.should eq 'dan'
    g.player_1.side.should eq 'x'
    g.player_2.side.should eq 'o'
    g.mark_space(0)
    g.mark_space(3)
    g.mark_space(2)
    g.mark_space(5)
    g.mark_space(1)
    g.board.x_spaces.length.should eq 3
    g.turn()
    g.win.should eq 'x'
  end
end
describe Board do
  it 'should have nine spaces' do
    b =Board.new
    b.space_count.should eq 9
    b.should be_an_instance_of Board
  end
end

describe Space do
  it 'should have a name 1-9' do
    s = Space.new(1)
    s.name.should eq 1
  end
end

describe Player do
  before do
    Player.reset
  end
  it 'should have a name and side either x or o, player1 is always x' do
    p1 = Player.new('dan')
    p2 = Player.new('cody')
    p1.name.should eq 'dan'
    p1.side.should eq 'x'
    p2.side.should eq 'o'
  end
end



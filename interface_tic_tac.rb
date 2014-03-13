require './lib/tic_tac'

puts 'Welcome to tic_tac_toe'
puts 'Player 1 please enter your name'
input = gets.chomp
puts 'Player 2 please enter your name'
input2 = gets.chomp


@g = Game.new(input, input2)
def drawboard
  puts "#{@g.interfacearray[0]} #{@g.interfacearray[1]} #{@g.interfacearray[2]}"
  puts "#{@g.interfacearray[3]} #{@g.interfacearray[4]} #{@g.interfacearray[5]}"
  puts "#{@g.interfacearray[6]} #{@g.interfacearray[7]} #{@g.interfacearray[8]}"
end
drawboard

puts 'WELCOME TO THE GAME!, X goes first, select a nubmer to chose a space'

def move
  @g.turn()
  if @g.win == 'x' || @g.win == 'o'
    drawboard
    return puts "HOORAY #{@g.player_to_move} has WON!"
  elsif @g.win == "MEOW"
    drawboard
    return puts "MEOW"
  end
  drawboard
  @g.turn()
selected_space = gets.chomp
@g.mark_space(selected_space.to_i)


puts "player to choose: #{@g.player_to_move}"
move
end
move

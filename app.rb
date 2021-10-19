require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'




def v1
player1 = Player.new("José")
player2 = Player.new("Josiane")
puts "Voici l'état de chaque joueur : "
player1.show_state
player2.show_state
puts

puts "Passons à la phase d'attaque :"
  while player1.life_points > 0 && player2.life_points >0
  player2.attack(player1)
  player1.show_state
  puts
    if player1.life_points < 0
    break 
    else player1.attack(player2)
    player2.show_state
    
    puts
    end
  end
end

human1 = HumanPlayer.new("Allan")

puts v1

 
require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'



    puts "------------------------------------------------
    |Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
    |Le but du jeu est d'être le dernier survivant !|
    -------------------------------------------------"

    def gamer 
      puts "Ton prénom : "
      print "> "
      @prenom =  gets.chomp
      human1 = HumanPlayer.new("#@prenom")
    end
   

    def enemy
      array = [player1 = Player.new("José"), player2 = Player.new("Josiane")]
    end


    def fight 
    joueur = gamer 
    player1 = enemy[0]
    player2 = enemy[1]
    puts "Passons à la phase d'attaque :"
      while joueur.life_points >0 && (player1.life_points > 0 || player2.life_points >0)

        puts "Quelle action veux-tu effectuer ?

        a - chercher une meilleure arme
        s - chercher à se soigner 
        
        attaquer un joueur en vue :
        0 - #{player1.show_state}
        1 - #{player2.show_state}"
        puts
        puts "ton choix :"
        print "> "
        result = gets.chomp
          if result == "a"
            joueur.search_weapon
          elsif result == "s"
            joueur.search_health_pack
          elsif result == 0.to_s 
            joueur.attack(player1)
          elsif result == 1.to_s
            joueur.attack(player2)
          else puts "Ce n'est pas une proposition, re choisi "
          end

        puts "Les autres joueurs t'attaquent !"
         enemy.each do |i|
          i.attack(joueur)if i.life_points > 0 
        
          end



      end
        puts "La partie est finie" 
        if joueur.life_points > player1.life_points && joueur.life_points > player2.life_points
          puts "BRAVO ! TU AS GAGNE !" 
        else "Loser ! Tu as perdu !"
        end

      end


   puts fight
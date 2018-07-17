require 'rubocop'
require 'pry'
require_relative 'boardcase'
require_relative 'board'
require_relative 'player'


class Game
  def initialize     #TO DO : créé 2 joueurs, créé un board
    puts"On va jouer au morpion!"
    puts "le premier qui a un alignement gagne"
    puts " "
    puts "Quel le nom du 1er joueur?"
    player1_name = gets.chomp
    puts" "

    puts "Quel le nom du 2ème joueur?"
    player2_name = gets.chomp
    puts" "

    @player1 = Player.new(player1_name, "X", "tu n'as pas encore gagné")
    @player2 = Player.new(player2_name, "O", "tu n'as pas encore gagné")

    @board = Board.new
  end

  def go    # TO DO : lance la partie
    puts" "
    puts"On va jouer au morpion!"
    puts "le premier qui a un alignement gagne"
    puts "C'est parti!"
    puts "Voici le board vide: "
    puts " "
    turn
  end

  def turn   #TO DO : affiche le plateau, demande au joueur il joue quoi, vérifie si un joueur a gagné, passe au joueur suivant si la partie n'est pas finie
    i = 0
    while i < 9
      @board.to_s
      
      if (i%2) == 0 
        joueur_i = @player1 
      else joueur_i = @player2
      end

      @board.play(joueur_i, joueur_i.value_x_o )
        if @board.victory 
          @board.to_s
          puts "#{joueur_i.player_name} a gagné !"
          i = 10

        else 
          i += 1
        end

        if i == 9
         @board.to_s
         puts "la partie est terminée, match nul"
         puts " "
        end
    end

            puts "Voulez-vous rejouer une partie? (Y/N)"
        réponse = gets.chomp
        if réponse == "Y" 
          Game.new.go
        elsif réponse =="N"
          exit
        else puts "Veuillez répondre par Y ou N "
        end 
  end

end

Game.new.go
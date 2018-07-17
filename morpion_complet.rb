require 'rubocop'
require 'pry'


class BoardCase  #TO DO : la classe a 2 attr_accessor, sa valeur (X, O, ou vide), ainsi que son numéro de case)
  attr_accessor :case_value # :case_number
  
  def initialize(case_value)    #TO DO doit régler sa valeur, ainsi que son numéro de case
    @case_value = case_value
    #@case_number = case_number
  end
  
  def to_s    #TO DO : doit renvoyer la valeur au format string
    return "#{case_value}"
  end

end

class Board
  include Enumerable #TO DO : la classe a 1 attr_accessor, une array qui contient les BoardCases
  attr_accessor :board

  def initialize    #TO DO :    #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
                                #Ces instances sont rangées dans une array qui est l'attr_accessor de la classe
    @A1 = BoardCase.new    @A1 = 0
    @A2 = BoardCase.new    @A2 = 1
    @A3 = BoardCase.new    @A3 = 2    
    @B1 = BoardCase.new    @B1 = 3     
    @B2 = BoardCase.new    @B2 = 4     
    @B3 = BoardCase.new    @B3 = 5
    @C1 = BoardCase.new    @C1 = 6    
    @C2 = BoardCase.new    @C2 = 7     
    @C3 = BoardCase.new    @C3 = 8

    @board = [ @A1.to_s , @A2.to_s  , @A3.to_s  , @B1.to_s  , @B2.to_s  , @B3.to_s  , @C1.to_s  , @C2.to_s  , @C3.to_s  ]
  end

  def to_s   #TO DO : afficher le plateau
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def play(player, value_x_o)   #TO DO : une méthode qui change la BoardCase jouée en fonction de la valeur du joueur (X, ou O)
    puts "#{player.player_name} choisis ta case entre 0 et 8 "
    case_number = gets.chomp.to_i
    if  @board[case_number]  != "X" && @board[case_number] != "O" 
        @board[case_number] = value_x_o

    else puts "la case est déjà prise, joue une case vide"

    end
  end

  def victory  #TO DO : qui gagne ?
    if @board[0] == @board[1] && @board[1] == @board[2] ||
       @board[3] == @board[4] && @board[4] == @board[5] ||
       @board[6] == @board[7] && @board[7] == @board[8] ||
       @board[0] == @board[3] && @board[3] == @board[6] ||
       @board[1] == @board[4] && @board[4] == @board[7] ||
       @board[2] == @board[5] && @board[5] == @board[8] ||
       @board[0] == @board[4] && @board[4] == @board[8] ||
       @board[2] == @board[4] && @board[4] == @board[6] 
        true
    else
      false
     end
  end
  
end

class Player   

  attr_accessor :player_name, :value_x_o
  attr_writer :a_gagne
  
  def initialize (player_name, value_x_o, a_gagne)  #TO DO : doit régler son nom, sa valeur, son état de victoire
    @player_name = player_name
    @value_x_o = value_x_o
    @a_gagne = false
  end
end

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
require 'rubocop'
require 'pry'


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
          play(player, value_x_o)

    end
  end

  def victory  #TO DO : qui gagne ?
    if @board[0] == @board[1] && @board[1] == @board[2]  ||
       @board[3] == @board[4] && @board[4] == @board[5]  ||
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


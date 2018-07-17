require 'rubocop'
require 'pry'

class Player   

  attr_accessor :player_name, :value_x_o
  attr_writer :a_gagne
  
  def initialize (player_name, value_x_o, a_gagne)  #TO DO : doit régler son nom, sa valeur, son état de victoire
    @player_name = player_name
    @value_x_o = value_x_o
    @a_gagne = false
  end
end


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


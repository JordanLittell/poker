require 'hand'

class Player
  attr_accessor :hand, :pot
  attr_reader :name, :out
  
  def initialize(name, pot)
    @name = name
    @hand = []
    @pot = pot
  end
  
  def fold
    "#{name} left the game"
  end
  
  def see
    1
  end
  
  def raise(amount)
    @pot -= amount
    return amount
  end
  
  def discard(*card_indexes)
    removed = []
    card_indexes.each do |card_index|
      removed << @hand.cards[card_index]
      @hand.remove_card([@hand.cards[card_index]])
    end
    removed
    
  end
  
  private 
  
  def get_user_bet(sym)
    p "enter the ammount you would like to #{sym.to_s}"
    input = gets.user.chomp.to_i
    input
  end
    
  
end
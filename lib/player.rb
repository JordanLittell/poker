require 'hand'

class Player
  attr_accessor :hand, :pot, :out
  attr_reader :name
  
  def initialize(name, pot)
    @name = name
    @hand = []
    @pot = pot
    self.out = false
  end
  
  def fold
    self.out = true
    p "#{name} left the game"
    
  end
  
  def see(see_amt)
    reduce_pot_by(see_amt)
  end
  
  def raise(raise_amt)
    reduce_pot_by(raise_amt)
  end
  
  def reduce_pot_by(amount)
    @pot -= amount
  end
  
  def collect_win(total_amt)
    @pot += total_amt
  end
  
  def discard(*card_indexes)
    removed = []
    card_indexes.each do |card_index|
      card = @hand.cards[card_index]
      removed << @hand.cards.delete(card)
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
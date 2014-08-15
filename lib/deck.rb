require 'card'

class Deck
  attr_reader :cards
  def initialize
    @cards = []
    seed_deck
  end
  
  def add_card(card)
    @cards << card
  end
  
  def seed_deck
    (2..14).each do |num|
      [:hearts, :spades, :diamonds, :clubs].each do |suit|
        self.add_card(Card.new(num, suit))
      end
    end
    @cards = @cards.shuffle
  end
  
  def remove_cards!(num_cards)
    pop_cards = []
    num_cards.times do 
      pop_cards << @cards.pop
    end
    pop_cards
  end
  
end
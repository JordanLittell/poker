require "game"
require "deck"
require "rspec"

RSpec.describe Deck do
  let(:game) { Game.new(2) }
  subject(:deck) { game.deck }
  
  describe "number of cards in deck" do
    it "has 38 cards after handing 7 cards each to 2 players" do
      expect(deck.cards.length).to eq(38)
    end
  end
  
  describe "card uniqueness" do 
    
    it "should not have any cards with the same face value and suit" do
      is_each_card_unique = deck.cards.all? do |card|
        deck.cards.none? do |comparison_card|
          (card.face == comparison_card.face) &&
          (card.suit) == (comparison_card.suit) &&
          (card != comparison_card)
        end
      end
      expect(is_each_card_unique).to be true
    end
    
  end
  
  describe "remove cards" do 
    it "deck shrinks if cards are removed" do
      deck.remove_cards!(5)
      expect(deck.cards.length).to eq(33)
    end
  end
  
  describe "add cards" do 
    it "grows if cards are added to it" do 
      deck.add_cards([Card.new(2,:hearts), 
        Card.new(3,:hearts), 
        Card.new(4,:hearts), 
        Card.new(5, :hearts), 
        Card.new(6,:hearts)
      ])
      expect(deck.cards.length).to eq(43)
    end
  end
end 
  